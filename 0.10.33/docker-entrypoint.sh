#!/bin/bash
set -e

cd /usr/src/app

appStart(){
  grunt deploy
  npm start
}

appBuild(){
  npm install
}

appHelp(){
  echo "Available options:"
  echo " app:build  - 初始化app"
  echo " app:start  - start"
  echo " app:help   - Displays the help"
  echo " [command]  - Execute the specified linux command eg. bash."
}

case "$1" in
  app:build)
    appBuild
    ;;
  app:start)
    shift 1
    appStart
    ;;
  app:help)
    appHelp
    ;;
  *)
    if [ -x $1 ]; then
      $1
    else
      prog=$(which $1)
      if [ -n "${prog}" ] ; then
        shift 1
        $prog $@
      else
        appHelp
      fi
    fi
    ;;
esac

exit 0