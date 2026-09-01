#!/bin/sh

: "${DOTFILES_ROOT:?DOTFILES_ROOT must point to the dotfiles repository}"
: "${DOTFILES_DRY_RUN:=0}"
: "${DOTFILES_HEADLESS:=0}"

info() {
	printf '\n==> %s\n' "$*"
}

warn() {
	printf 'warning: %s\n' "$*" >&2
}

die() {
	printf 'error: %s\n' "$*" >&2
	exit 1
}

has() {
	command -v "$1" >/dev/null 2>&1
}

run() {
	if [ "$DOTFILES_DRY_RUN" -eq 1 ]; then
		printf '+'
		printf ' %s' "$@"
		printf '\n'
		return 0
	fi
	"$@"
}

run_as_root() {
	if [ "$(id -u)" -eq 0 ]; then
		run "$@"
	elif has sudo; then
		run sudo "$@"
	else
		die "sudo is required to run: $*"
	fi
}
