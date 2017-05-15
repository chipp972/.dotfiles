const path = require('path')
const exec = require('child_process').exec
const fs = require('fs')
const R = require('ramda')





// install selected packages

const getPkgList = R.reduce(R.concat, 'yaourt -S --noconfirm ')

console.log(getPkgList(pkgs))
