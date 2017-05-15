const R = require('ramda')
const pkgs = require('./packages.json')
const args = process.argv

// NO_INSTALL=$1
// CONFIG_HOME=$(dirname $(readlink -f $0))

// # delete log
// rm -f "$CONFIG_HOME"/install.log

// # install softwares
// if [ ! "$NO_INSTALL" ]; then
// 	sudo sh "$CONFIG_HOME"/scripts/software_install.sh
// fi

// # create the symlinks
// sh "$CONFIG_HOME"/scripts/link.sh

const doServerInstall = (arr) => console.log('server')
const doDevInstall = (arr) => console.log('dev')
const doDefaultInstall = (arr) => console.log('default')
const logHelp = (arr) => console.log('help')


const containsServerOpt = R.or(R.contains('-s'), R.contains('--server'))
const containsDevOpt = R.or(R.contains('-d'), R.contains('--dev'))
const containsHelpOpt = R.or(R.contains('-h'), R.contains('--help'))


/**
 * takes an object containing an opt array and a pkgs array
 * and determine which type of install to execute
 */
const startInstall = R.cond([
	[R.compose(containsHelpOpt, R.prop('opt')), logHelp],
	[R.compose(containsServerOpt, R.prop('opt')), doServerInstall],
	[R.compose(containsDevOpt, R.prop('opt')), doDevInstall],
	[R.T, doDefaultInstall],
])

startInstall({ opt: args, pkgs })

const endMessage = `Installation done; Please reboot for changes to take effect`
console.log(endMessage)
