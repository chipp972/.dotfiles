// @flow
import { symlink, ensureSymlink, readdir } from 'fs-extra';
import Listr from 'listr';
import execa from 'execa';

/**
 * create a symlink for each folder and file in config to ~/.${source}
 * show a progress bar
 */

execa('fc-cache', ['-f', '-v']); // reload font cache
