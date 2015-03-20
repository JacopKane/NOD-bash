#!/usr/bin/env bash

export PHP55="$(brew --prefix homebrew/php/php55)"
export PHP55_LIB="$PHP55/lib/php"
export PATH="$PHP55/bin":$PATH
export PHP56="$(brew --prefix homebrew/php/php56)"
export PHP56_LIB="$PHP56/lib/php"
export PATH="$PHP56/bin":$PATH
export ISSET_PHP=0;

function nod-phpUpdate() {
	export UPDATE_PHP_STATUS=1;
	if
		composer selfupdate &&
		pear update-channels &&
		pear upgrade-all &&
		pecl update-channels &&
		pecl upgrade-all
	then
		UPDATE_PHP_STATUS=0;
  fi
	return $UPDATE_PHP_STATUS;
}
