### Gimme Plugin

[Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/) plugin to use
[gimme](https://github.com/travis-ci/gimme/) to manage [Go](https://golang.org)
installations.

On zsh startup, go will be provided either by sourcing ```~/.gimme/envs/latest.env```
if it exists, or by running ```gimme stable```.

Provides following functions/aliases:
  - ```load-go```: A wrapper for gimme. If called with arguments, these arguments
  are forwarded to gimme. A call without arguments is equivalent to ```eval "$(gimme stable)"```
  - ```go-versions```: Alias for ```gimme -l```

```gimme``` is assumed to be in ```~/bin```, so make
sure to add this folder to the $PATH variable.
If ```gimme``` is not found in ```~/bin```, it will be
installed there.
