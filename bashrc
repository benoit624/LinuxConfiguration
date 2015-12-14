#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export VISUAL=vim
alias ls='ls --color=auto'
alias tp=tp
PS1='[\u@\h \W]\$ '
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;31m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
tp()
{
  dirtp=~/git/TPSPE/forget_c-s3-tuto/
  #dirtp=~/git/TPSPE/
  if [ "$(date +%u)" -eq "1" ]
  then
    datelstm=$(date -d 'monday' +%Y%m%d)
  else
    datelstm=$(date -d 'last monday' +%Y%m%d)
  fi
  file=$(ls $dirtp | grep $datelstm)
  if [ "$file" = "" ]
  then
    file=$(wget -q http://wiki-prog.infoprepa.epita.fr/index.php/Cat%C3%A9gorie\:EPITA\:TP\:20152016 -O - | grep \>$datelstm | cut -d'"' -f4 | cut -d':' -f4)
    #file=$datelstm
    file=$datelstm"_"$file
    mkdir $dirtp$file
    echo "création du possible repo"
    rm Catégorie\:EPITA\:TP\:20152016
  fi
  cd $dirtp$file
  echo "vous voila dans votre repo de la semaine"
  echo "vérification de l'architecture..."
  if [ ! -f AUTHORS ]
  then
    echo "* forget_c">AUTHORS
    echo "AUTHORS ajouté"
  fi
  if [ ! -f Makefile ]
  then
    cp ../template/Makefile ./
    echo "Makefile ajouté"
  fi
  if [ ! -f subject.html ]
  then
    add=$(wget -q http://wiki-prog.infoprepa.epita.fr/index.php/Cat%C3%A9gorie:EPITA:TP:20152016 -O - | grep \>$datelstm | cut -d'"' -f4 )
    wget -q -O subject.html http://wiki-prog.infoprepa.epita.fr/index.php/$add
    echo "sujet ajouté"
  fi
}
