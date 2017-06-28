# Load a go version and/or source the versions environment.
# If no version is provided, 'stable' will be loaded.
function load-go {
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


# gimme completion
__gimme_completion() {
  local version_1 version_2 version_3
  version_1="1.8.3"
  version_2="1.7.6"
  version_3="1.6.4"
  local context state state_descr line
  typeset -a go_versions
  go_versions+=(
  '(help version force list tip '$version_1' '$version_2' '$version_3' \
    )stable[install latest stable go version]'
  '(help version force list stable '$version_1' '$version_2' '$version_3' \
    )tip[install development version (master branch) of go]'
  '(help version force list stable tip '$version_2' '$version_3' \
    )'$version_1'[install go version '$version_1']'
  '(help version force list stable tip '$version_1' '$version_3' \
    )'$version_2'[install go version '$version_2']'
  '(help version force list stable tip '$version_1' '$version_2' \
    )'$version_3'[install go version '$version_3']'
  )
  typeset -a flags
  flags+=(
  '(version force list stable tip '$version_1' '$version_2' \
    '$version_3')help[show help text and exit]'
  '(help force list stable tip '$version_1' '$version_2' \
    '$version_3')version[show the gimme version only and exit]'
    '(help version list)force[remove the existing go installation if present prior to install]'
    '(help version force stable tip '$version_1' '$version_2' \ 
    '$version_3')list[list installed go versions and exit]'
    )
      _values -w 'flags go_versions' ${flags[@]} ${go_versions[@]}
      return
}

__load-go_completion() {
  local version_1 version_2 version_3
  version_1="1.8.3"
  version_2="1.7.6"
  version_3="1.6.4"
  local context state state_descr line
  typeset -a go_versions
  go_versions+=(
  '(tip '$version_1' '$version_2' '$version_3' \
    )stable[latest stable go version]'
  '(stable '$version_1' '$version_2' '$version_3' \
    )tip[development version (master branch) of go]'
  '(stable tip '$version_2' '$version_3' \
    )'$version_1'[go version '$version_1']'
  '(stable tip '$version_1' '$version_3' \
    )'$version_2'[go version '$version_2']'
  '(stable tip '$version_1' '$version_2' \
    )'$version_3'[go version '$version_3']'
  )
  _values 'go_versions' ${go_versions[@]}
}

compdef __gimme_completion gimme
compdef __load-go_completion load-go
