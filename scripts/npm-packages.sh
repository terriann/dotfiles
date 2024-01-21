#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'  # Reset color to default

SCRIPTDIR=$(readlink -f $(dirname $0)) # Directory this script is in.
SCRIPTNAME=$0
PROJECTROOT=$(readlink -f $SCRIPTDIR/../); # Traverse up one from scripts dir.
LOGDIR=$PROJECTROOT/logs
DATESTR=$(date "+%Y-%m-%d")
NODEV=$(node -v)
NPMV=$(npm -v)
LOGFILEPREFIX=$DATESTR-npm-global-packages
LOGFILEBEFORE=$LOGFILEPREFIX-before.log
LOGFILEAFTER=$LOGFILEPREFIX-after.log

SCRIPTPOSITION=$1 # Reads the before or after parameter

usage() {
    cat << EOF >&2
Usage: $SCRIPTNAME [before|after]

before: Runs the operations before update npm to LTS and updating the gloabl NPM pacakges.
after: Runs the operations after updates.
EOF
  exit 1
}

case $SCRIPTPOSITION in

  "before")
        # Count files in log dir.
        LOGFILESINDIR=$(ls -1 $LOGDIR | grep -i -e '\.log$' | wc -l)
        # Trim leading and trailing spaces.
        LOGFILESINDIR="$(echo -e "${LOGFILESINDIR}" | tr -d '[:space:]')"

        # Leaves a 50 log buffer.
        if [ "$LOGFILESINDIR" -gt 60 ]; then
            echo -e "${YELLOW}[LOGDIR CHECK]${RESET} $LOGFILESINDIR logs in $LOGDIR - Purging 10 oldest files."

            # Deletes the 10 oldest .log files.
            # Deleting mor elogs than the script will leave
            # creates a buffer for the next few runs.
            ls -1 -t $LOGDIR | grep -i -e '\.log$' | tail -n 10 | xargs -I {} rm "$LOGDIR/{}"
            
            echo -e "${YELLOW}[LOGDIR CHECK]${RESET} Done.\n"
        fi

        # Do not clobber any existing before file because we
        # want the earliest log of the day to persist for all
        # later diffs.
        if test -f $LOGDIR/$LOGFILEBEFORE; then
            echo "Node.js version: $NODEV"
            echo "npm version: $NPMV"

            echo -e "${YELLOW}An earlier file already exists of logged npm packages to be used for comparison:${RESET} $LOGDIR/$LOGFILE \n"
            echo "Current packages:"
            npm list -g
          else
            echo "Node.js version: $NODEV" | tee $LOGDIR/$LOGFILEBEFORE
            echo "npm version: $NPMV" | tee -a $LOGDIR/$LOGFILEBEFORE
            npm list -g -pl >> $LOGDIR/$LOGFILEBEFORE

            echo -e "Logged a list of globally installed NPM packages to $LOGDIR/$LOGFILE \n"
            npm list -g
        fi
    ;;

  "after")
        echo "Node.js version: $NODEV" | tee $LOGDIR/$LOGFILEAFTER
        echo "npm version: $NPMV" | tee -a $LOGDIR/$LOGFILEAFTER
        npm list -g -pl >> $LOGDIR/$LOGFILEAFTER

        npm list -g
        echo -e "Logged a list of globally installed NPM packages to $LOGDIR/$LOGFILE for diff comparison...\n" # -e is necessary to support \n consistently.

        diff --color -u $LOGDIR/$LOGFILEBEFORE $LOGDIR/$LOGFILEAFTER

        echo -e "✅ ${GREEN}Update complete.${RESET} Assess diff (above) to see if it is necessary to reinstall any global packages. Bye."
    ;;

  *)
    usage
    ;;
esac
