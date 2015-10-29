export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export LESS=-RFX
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GREP_OPTIONS="--color=auto"

export RUBYMOTION_ANDROID_SDK=~/Library/Android/sdk
export RUBYMOTION_ANDROID_NDK=~/Library/Android/ndk

if [ -f "$HOME/.bashrc" ]; then
  . $HOME/.bashrc
fi
