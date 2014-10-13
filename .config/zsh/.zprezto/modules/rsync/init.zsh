#
# Defines Rsync aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[rsync] )); then
  return 1
fi

#
# Aliases
#

_rsync_cmd='rsync --verbose --progress --human-readable --archive --hard-links --one-file-system'

alias rscp="${_rsync_cmd}"
alias rsmv="${_rsync_cmd} --remove-source-files"
alias rsupdate="${_rsync_cmd} --update"
alias rssync="${_rsync_cmd} --update --delete"

unset _rsync_cmd

