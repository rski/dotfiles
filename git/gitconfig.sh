#!/usr/bin/env bash

GCF="git config --global"

$GCF user.name "Romanos Skiadas"

$GCF push.default "simple"

$GCF core.editor "vim"
$GCF core.excludesfile "$HOME/.gitignore"

$GCF diff.tool "vimdiff"

$GCF merge.tool "vimdiff"
$GCF merge.conflictstyle "diff3"

$GCF difftool.prompt  "false"

$GCF alias.unstage "reset HEAD --"
$GCF alias.s "status"

# TODO(rski): do not prompt if an email is already set
if [ `hostname` != "nauticus" ]
then
  echo -n "Git email: "
  read email
  $GCF user.email $email
fi
