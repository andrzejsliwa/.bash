#!/bin/sh

if [ -d $HOME/.bash ]
then
  cd ~/.bash ; git pull
else
  git clone git@github.com:andrzejsliwa/.bash.git ~/.bash
fi

grep "~/.bash/init.bash" ~/.bashrc >/dev/null || echo "source ~/.bash/init.bash" >> ~/.bashrc

