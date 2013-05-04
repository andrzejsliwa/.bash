#!/bin/sh

if [ -d $HOME/.bash ]
then
  cd ~/.bash ; git pull
else
  git clone git@github.com:andrzejsliwa/.bash.git ~/.andrzej-bash
fi
grep "alias abash" ~/.bashrc >/dev/null       || echo 'alias abash="source ~/.andrzej-bash/init.bash"' >> ~/.bashrc
source ~/.bashrc
