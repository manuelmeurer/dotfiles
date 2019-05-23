alias ls="ls -lah"
alias st="subl"

alias ss="script/server"
alias sc="script/console"
alias sg="script/generate"
alias sp="script/plugin"
alias sr="script/runner"

alias rs="bundle exec rails server"
alias rc="bundle exec rails console"
alias rg="bundle exec rails generate"
alias rgm="bundle exec rails generate migration"
alias rpi="bundle exec rails plugin install"

alias rdc="bundle exec rake db:create --trace"
alias rdm="bundle exec rake db:migrate --trace"
alias rdm0="bundle exec rake db:migrate VERSION=0 --trace"
alias rdmr="bundle exec rake db:migrate:redo --trace"
alias rdtc="bundle exec rake db:test:clone_structure --trace"
alias rds="bundle exec rake db:seed --trace"
alias rdd="bundle exec rake environment db:drop --trace" # Load environment so custom drop task for Postgres is loaded
alias rdr="bundle exec rake db:rollback --trace"
alias rr="bundle exec rake routes --trace"
alias rrg="bundle exec rake routes --trace | grep"

alias ann="bundle exec annotate -p after --classified-sort"

alias glg="gem list | grep"
alias gi="gem install"
alias gu="gem uninstall"
alias go="gem open"
alias gcl="gem cleanup"
alias gbtr="gem bump --tag --release"

alias sgi="sudo gem install"
alias sgu="sudo gem uninstall"
alias sgcl="sudo gem cleanup"

alias sai="sudo apt-get install"

alias bi="bundle install"
alias be="bundle exec"
alias bu="bundle update"
alias bo="bundle open"
alias blg="bundle list | grep"

alias devtail="tail -f log/development.log"
alias testtail="tail -f log/test.log"
alias prodtail="tail -f log/production.log"
alias pumatail="tail -f ~/Library/Logs/puma-dev.log"

alias ttr="touch tmp/restart.txt"
alias ap="ansible-playbook"

alias scpresume="rsync --partial --progress --rsh=ssh"

function ghpr() {
  repo=$(git config --list | grep 'remote\.origin\.url' | grep 'github\.com' | sed -E "s/.+(https:\/\/github.com\/|git@github\.com:)(.+)\.git/\2/")

  [ -z "$repo" ] && echo "This doesn't seem like a GitHub repo." && return

  branch=$(__git_ps1 %s)

  open https://github.com/$repo/compare/$branch;
}

# Check if hub is installed and, if so, alias to git
command -v hub >/dev/null 2>&1 && alias git=hub

alias g="git"
alias h="heroku"

alias mb="bundle exec middleman build"
alias ms="bundle exec middleman server"

alias uplink-prod-console="ssh -t worker01 'bash -ic \"cd /var/www/uplink/ && rc\"'"

function fname() { find . -iname "*$@*"; }
function psg() { ps aux | grep -v grep | grep "$@" -i --color=auto; }
function mcd() { mkdir $1 && cd $1; }
