# Load a go version and/or source the versions environment.
# If no version is provided, 'stable' will be loaded.
load-go() {
  if [[ "$#" == 0 ]] ; then
    eval "$(gimme stable)"
  else
    eval "$(gimme ${*})"
  fi
}

# alias for gimme -l
alias go-versions='gimme -l'

# if gimme is not in ~/bin, download it
if ! [ -e ~/bin/gimme ] ; then
  if ! [ -d ~/bin ] ; then
    mkdir ~/bin
  fi
  curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
  chmod +x ~/bin/gimme
fi

# Load either "latest.env" or "stable" version on startup
if [ -e ~/.gimme/envs/latest.env ] ; then
  source ~/.gimme/envs/latest.env &>/dev/null
else
  load-go &>/dev/null
fi
