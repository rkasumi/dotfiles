# 環境変数
export LANG=ja_JP.UTF-8
export LESSCHARSET=UTF-8

case "${OSTYPE}" in
darwin*)
  export JAVA_HOME='/Library/Java/Home'
  export JAVA_OPTS='-Dfile.encoding=UTF-8'
  export PATH=/usr/local/bin:$PATH
  ;;
linux*)
  ;;
esac

# key bind -v = vim -e = emacs
bindkey -e

# プロンプト設定
PROMPT="%B%F{red}[%~] # %f%b"
PROMPT2="%B%{[31m%}#%{[m%}%b "
SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "

# 標準のエディタをvimに設定 vimがなければviに
export EDITOR=vim
if ! type vim > /dev/null 2>&1; then
  alias vim=vi
fi

# 補完機能
fpath=($HOME/.zsh/completions $fpath)
autoload -U compinit; compinit
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin # suduでも補完する
zstyle ':completion:*:default' menu select # 十字キーで補完候補を選ぶ

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt hist_ignore_all_dups # ignore duplication command history list
setopt share_history        # share command history data
setopt append_history       # zshを複数使う場合にファイルに上書きせず追加
function history-all { history -E 1 }

# オプション設定
setopt auto_cd # cd省略可
setopt auto_pushd # cd履歴(cd-[TAB])
setopt pushd_ignore_dups # cd履歴の重複を保存しない
setopt correct # コマンドの間違いを修正
setopt list_packed # 補完をつめて表示
setopt nolistbeep # 補完時にエラー音を鳴らさない
setopt magic_equal_subst # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる

# カラー設定
export GREP_COLOR='01;33'
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# alias設定
setopt complete_aliases
alias la='ls -a'
alias grep='grep --color=auto'
alias less='less -M'
alias where="command -v"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias c="clear"
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# functions
# cd 後にlsを実行
function cd() {builtin cd $@ && ls -v -FGh}
# ^ で上でのディレクトリへ移動
function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '^' cdup
# extract で何でも解凍
function extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.lzma)      lzma -dv $1    ;;
          *.xz)        xz -dv $1      ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}
alias ex='extract'

case "${OSTYPE}" in
darwin*)
  # mac用
  alias ls="ls -FGh"
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias tmux='tmuxx'
  alias cocot='cocot -t UTF-8 -p EUC-JP -- ssh'
  ;;
linux-gnu*)
  # ubuntu用
  alias ls="ls -FGh --color=auto"
  alias cpanm="nocorrect cpanm"
  ;;
cygwin*)
  ls() {/usr/bin/ls -I'NTUSER.DAT*' -I'ntuser.dat*'}
  la() {/usr/bin/ls -a}
  ;;
esac

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
