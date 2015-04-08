## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## jobs
setopt long_list_jobs

## pager
export PAGER="less"
export LESS="-R"

## super user alias
alias _='sudo'
alias please='sudo'

## more intelligent acking for ubuntu users
alias afind='ack-grep -il'

# only define LC_CTYPE if undefined
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
	export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi

# Quick and dirty encryption
function encrypt() {
    openssl des3 -a -in $1 -out $1.des3
}
function decrypt() {
    openssl des3 -d -a -in $1 -out ${1%.des3}
}

autoload -U zmv
bindkey "^[m" copy-prev-shell-word

## pretty man pages
function pman() {
    man $1 -t | open -f -a Preview
}

## pretty JSON
function pj() {
    python -mjson.tool
}

## Open current directory
alias oo='open .'

## Quick-look a file (^C to close)
alias ql='qlmanage -p 2>/dev/null'

## Start a local SMTP server and dump emails sent to it to the console
alias smtpconsole='python -m smtpd -n -c DebuggingServer localhost:1025'

## Serve the current folder on port 80
alias serve_this='python -m SimpleHTTPServer'

## Highlight-aware less command
alias hl='less -R'

## Show history
alias history='fc -l 1'
