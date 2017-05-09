const R = require('ramda')
const fs = require('fs-extra')
const Future = require('ramda-fantasy').Future
const exec = require('promised-exec')

const pacmanConf = `
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
`

const install = R.unless(
  (cmd) => cmd !== '',
  // installYaourt
  () => 'haha'
  // console.log
)

install(exec('command -v yaourt'))

// install yaourt
const installYaourt = (isInstalled) => Future((reject, resolve) => {
  isInstalled
  ? reject('yaourt is already installed')
  : fs.appendFile('/etc/pacman.conf', pacmanConf).then(resolve).catch(reject)
})

exec('sudo pacman -Syu yaourt --noconfirm')
exec('yaourt -Syu --noconfirm')
