export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export LESS=-RFX
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export RUBY_DEP_GEM_SILENCE_WARNINGS=1

if [ -f "$HOME/.bashrc" ]; then
  source $HOME/.bashrc
fi

# Copied from Hatchbox bash_profile
# Skip if not interactive or not the deploy user.
[ -z "$PS1" ] || [ "$USER" != "deploy" ] && return

# Print out Hatchbox instructions for users
echo "$(tput -T xterm setaf 2)$(tput -T xterm bold)"
cat << "EOF"
  _   _       _       _     _
 | | | | __ _| |_ ___| |__ | |__   _____  __
 | |_| |/ _` | __/ __| '_ \| '_ \ / _ \ \/ /
 |  _  | (_| | || (__| | | | |_) | (_) >  <
 |_| |_|\__,_|\__\___|_| |_|_.__/ \___/_/\_\
EOF
echo "$(tput -T xterm sgr0)"

echo "The following apps deployed to this server:"
echo

for path in /home/deploy/*; do
    [ -d "${path}/current" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"

    echo "* $(tput -T xterm setaf 1)$(tput -T xterm bold)$dirname$(tput -T xterm sgr0)"

    for service in /home/deploy/.config/systemd/user/$dirname-*.service; do
      process="$(basename "${service}" .service)"
      echo "  To read the $process process logs:"
      echo "    $(tput -T xterm setaf 4)journalctl --user --unit=$process --follow$(tput -T xterm sgr0)"
    done

    if grep -q "^  rails" "$path/current/Gemfile.lock" 2>/dev/null; then
      echo "  To open the Rails console:"
      echo "    $(tput -T xterm setaf 4)cd ~/$dirname/current && bundle exec rails c$(tput -T xterm sgr0)"
    fi

    echo
done
