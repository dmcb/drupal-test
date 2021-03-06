#!/bin/bash

if [ $# -ne 5 ]; then
	echo "Usage: ./"`basename $0`" base_url remote_host remote_user root uri"
	echo "e.g. ./"`basename $0`" http://www.hotelalma.ca wcmdev.ucalgary.ca wcm /d7/current hotelalma"
	exit 1
fi

BASE_URL="$1"
REMOTE_HOST="$2"
REMOTE_USER="$3"
ROOT="$4"
URI="$5"

export BEHAT_PARAMS="{\"extensions\":{\"Behat\\\\MinkExtension\":{\"base_url\":\"$BASE_URL\"}}}"
cp behat.aliases.drushrc.php.default behat.aliases.drushrc.php
sed -i -e "s!\$REMOTE_HOST!$REMOTE_HOST!" behat.aliases.drushrc.php
sed -i -e "s!\$REMOTE_USER!$REMOTE_USER!" behat.aliases.drushrc.php
sed -i -e "s!\$ROOT!$ROOT!" behat.aliases.drushrc.php
sed -i -e "s!\$URI!$URI!" behat.aliases.drushrc.php
mkdir -p ~/.drush
cp behat.aliases.drushrc.php ~/.drush/behat.aliases.drushrc.php

bin/behat