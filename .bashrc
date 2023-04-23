# My bashrc file. You'll see I am not very good with naming variables, I will rename them to something nicer.
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exports
export EDITOR="nvim"

## table full of hello world in different languages, this is echoed in the terminal first thing.
heyworld=~/.config/helloworld.sh
source "$heyworld"
heyoworld=${helloworld[ $RANDOM % ${#helloworld[@]} ]}
# echo heyoworld
echo "$heyoworld"


## aliases, i'll try to explain the reasoning for them
# johnsay ( get this at in my scripts repository @ https://github.com/minegamer72/scripts )
alias johnsay='~/Documents/apps/johnsay.sh'
# echo random hello world again
alias helloworld='heyoworld=${helloworld[ $RANDOM % ${#helloworld[@]} ]};echo "$heyoworld"'
# opendoas replacing sudo, but i don't like typing doas so i just aliased sudo
alias 	sudo='doas'
# in case i need the real sudo command (i've had things break)
alias 	sudoo='/usr/bin/sudo'
# same thing with doas, i don't really associate the word "cava" with audio visualizers
alias 	vis='cava'
# yt-dlp stuff ( pulled from Derek Taylors gitlab @ https://gitlab.com/dwt1 )
alias 	yt-dlp-best="yt-dlp -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best " # this one was pulled from reddit
alias 	ytp-aac="yt-dlp --extract-audio --audio-format aac "
alias 	ytp-best-audio="yt-dlp --extract-audio --audio-format best "
alias 	ytp-flac="yt-dlp --extract-audio --audio-format flac "
alias 	ytp-m4a="yt-dlp --extract-audio --audio-format m4a "
alias 	ytp-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias 	ytp-opus="yt-dlp --extract-audio --audio-format opus "
alias 	ytp-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias 	ytp-wav="yt-dlp --extract-audio --audio-format wav "
# serves as a reminder for me
yt-dlp-help ()
{
	echo "--------------------------------------------------------------------------"
	echo "yt-dlp: Regular command that still requires arguments. (run 'ytp-dlp --help' for a list of flags)"
	echo "yt-dlp-best: Get the best possible audio and video."
	echo "ytp-aac: Get the best aac format available."
	echo "ytp-best-audio: Get the best possible audio in the best possible format."
	echo "ytp-flac: Get the best possible flac."
	echo "ytp-m4a: Get the best possible m4a."
	echo "ytp-mp3: Get the best possible mp3."
	echo "ytp-opus: Get the best possible opus."
	echo "ytp-vorbis: Get the best possible vorbis."
	echo "ytp-wav: Get the best possible wav."
	echo "--------------------------------------------------------------------------"
}

# i cannot get used to putting the n in front of vim
alias 	vim="nvim"
#emacs (todo: learn how to use emacs!!!)
alias 	emacs="emacs -nw"
#literally saves like 2 seconds but yeah
alias 	smount="sudo mount"
# timer
alias 	timer='tclock timer -d'
# stopwatch
alias	stopwatch='tclock stopwatch'
# cmus
alias	music='cmus'
# reloadbashrc
alias	reloadbashrc='clear;. ~/.bashrc'
##

# rng to determine if the terminal should run pfetch or uwufetch at startup
cmd=$((1 + RANDOM % 10)) ## get a random number from 1 - 10
case $cmd in 
	10) # if 10 then
	uwufetch # run uwufetch
	;;
	*) # if anything else
	pfetch # run pfetch
	;;
esac
##

alias 	ls='ls --color=auto'

## Old PS1 stuff
# basically: [bob@archlinux /]$ 
#PS1='[\u@\h \W]\$ '
#PS1='\$\u > '

## not needed since my switch to starship prompt (nerdfonts needed)
#case $cmd in # another case statement to pair with uwufetch
#	10) # if 10 then
#	PS1='[ bowob][ \w] sez: \n '
#	;;
#*)# if anything else
#	PS1='[ \u][ \w] \n '
#	;;
#esac

# starship prompt
eval "$(starship init bash)"
