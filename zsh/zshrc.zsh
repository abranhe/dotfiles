# Path to your oh-my-zsh installation.
export ZSH="/Users/abranhe/.oh-my-zsh"

#HERE
ZSH_THEME="robbyrussell"

# Oh My Shell Plugins
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh


# Load .aliases and other files...
for file in ~/.{aliases,functions,path,dockerfunc,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file


# added by travis gem
[ -f /Users/abranhe/.travis/travis.sh ] && source /Users/abranhe/.travis/travis.sh
