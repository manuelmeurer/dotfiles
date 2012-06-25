alias ls='ls -lah'

alias ss='script/server'
alias sc='script/console'
alias sg='script/generate'
alias sp='script/plugin'
alias sr='script/runner'

alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias rg='bundle exec rails generate'
alias rr='bundle exec rails runner'
alias rgm='bundle exec rails generate migration'
alias rpi='bundle exec rails plugin install'

alias rdc='bundle exec rake db:create --trace'
alias rdm='bundle exec rake db:migrate --trace'
alias rdm0='bundle exec rake db:migrate VERSION=0 --trace'
alias rdmr='bundle exec rake db:migrate:redo --trace'
alias rdtc='bundle exec rake db:test:clone --trace'
alias rds='bundle exec rake db:seed --trace'
alias rdd='bundle exec rake db:drop --trace'
alias rdr='bundle exec rake db:rollback --trace'

alias ann='bundle exec annotate -p before'

alias glg='gem list | grep'
alias gi='gem install'
alias gu='gem uninstall'
alias go='gem open'
alias gcl='gem cleanup'

alias sgi='sudo gem install'
alias sgu='sudo gem uninstall'
alias sgcl='sudo gem cleanup'

alias bi='bundle install'
alias be='bundle exec'
alias bu='bundle update'
alias bo='bundle open'
alias blg='bundle list | grep'

alias cpd='bundle exec cap production deploy'
alias csd='bundle exec cap staging deploy'
alias cwd='bundle exec cap worker deploy'
alias cpda='bundle exec cap production deploy:app_config'
alias csda='bundle exec cap staging deploy:app_config'
alias cwda='bundle exec cap worker deploy:app_config'

alias psg='ps aux | grep'

alias devtail='tail -f log/development.log'
alias testtail='tail -f log/test.log'
alias statail='tail -f log/staging.log'
alias prodtail='tail -f log/production.log'

alias ttr='touch tmp/restart.txt'

alias scpresume='rsync --partial --progress --rsh=ssh'

alias g=git
alias h=heroku
