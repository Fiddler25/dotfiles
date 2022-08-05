#!/bin/zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm "${ZDOTDIR:-$HOME}/.zpreztorc"
cp ".bin/.zpreztorc" "${ZDOTDIR:-$HOME}"

rm "${ZDOTDIR:-$HOME}/.zshrc"
cp ".bin/.zshrc" "${ZDOTDIR:-$HOME}"