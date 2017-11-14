// @flow
import execa, { ExecaReturns } from 'execa';
import Listr from 'listr';
// const R = require('ramda');
// const fs = require('fs-extra');

// 'apt-get install neovim';

// 'update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60';
// 'update-alternatives --config vi';
// 'update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60';
// 'update-alternatives --config vim';
// 'update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60';
// 'update-alternatives --config editor';

type Command = {
  cmd: string,
  args: Array<string>,
};

type InstallObject = {
  displayName: string,
  cmd: string,
  pre: Array<Command>,
  preinstall: Array<string>,
  install: string,
  postinstall: Array<string>,
  post: Array<Command>,
};

const nvim: InstallObject = {
  displayName: 'neovim',
  cmd: 'nvim',
  pre: [
    { cmd: 'add-apt-repository', args: ['ppa:neovim-ppa/stable'] },
    { cmd: 'apt-get', args: ['update'] },
  ],
  preinstall: ['python-dev', 'python-pip', 'python3-dev', 'python3-pip'],
  install: 'neovim',
  postinstall: [],
  post: [
    {
      cmd: 'update-alternatives',
      args: ['--set', 'vi', '/usr/bin/nvim'],
    },
    {
      cmd: 'update-alternatives',
      args: ['--set', 'vim', '/usr/bin/nvim'],
    },
    {
      cmd: 'update-alternatives',
      args: ['--set', 'editor', '/usr/bin/nvim'],
    },
  ],
};

const installPackages = (packageList: Array<string> | string): Promise<string> =>
  new Promise((resolve, reject) => {
    const args = Array.isArray(packageList)
      ? ['install', '-y', ...packageList]
      : ['install', '-y', packageList];
    execa('apt-get', args)
      .then(result => resolve(result.stdout))
      .catch(err => reject(err.stderr));
  });

const installPackage = (packageName: string): Promise<string> =>
  execa('apt-get', ['install', '-y', packageName]);

const executeCommands = (commands: Array<Command>): Promise<string[]> =>
  new Promise((resolve, reject) => {
    Promise.all(commands.map(command => execa(command.cmd, command.args)))
      .then(result => resolve(result.map(res => res.stdout)))
      .catch(err => reject(err));
  });

/**
 * create a Listr task from an InstallObject
 */
const installTask = (installObj: InstallObject): Listr =>
  new Listr([
    {
      title: `checking if ${installObj.displayName} is installed`,
      task: (ctx) => {
        execa('which', [installObj.cmd])
          .then((result) => {
            ctx.isInstalled = result.stdout !== '';
          })
          .catch(err => Promise.reject(new Error(err.stderr)));
      },
    },
    {
      title: `Executing pre-requisite commands`,
      enabled: ctx => !ctx.isInstalled,
      task: () => executeCommands(installObj.pre)
    },
    {
      title: `Installing pre-requisite packages`,
      enabled: ctx => !ctx.isInstalled,
      task: () => installPackages(installObj.preinstall),
    },
    {
      title: `${installObj.displayName} installation`,
      enabled: ctx => !ctx.isInstalled,
      task: () => installPackage(installObj.install),
    },
    {
      title: 'Installing post-install packages',
      enabled: ctx => !ctx.isInstalled,
      task: () => installPackages(installObj.postinstall),
    },
    {
      title: `Executing post-install commands`,
      enabled: ctx => !ctx.isInstalled,
      task: () => executeCommands(installObj.post)
    },
  ]);

const setup = new Listr([
  {
    title: 'nvim installation',
    task: () => installTask(nvim),
  },
]);

setup.run().catch((err) => {
  if (/Permission denied/gi.test(err.stderr)) {
    console.log('Try to run the script with sudo');
  }
});
