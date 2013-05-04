#!/bin/sh

if [ -d $HOME/.andrzej-bash ]
then
  cd ~/.andrzej-bash ; git pull
else
  git clone git@github.com:andrzejsliwa/.bash.git ~/.andrzej-bash
fi
grep "alias abash" ~/.bashrc >/dev/null       || echo 'alias abash="source ~/.andrzej-bash/init-server.bash"' >> ~/.bashrc
source ~/.bashrc
