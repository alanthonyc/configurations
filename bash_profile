# .bash_profile is only executed on login shells. new terminals usually only execute .bashrc. Mac OSX always executes
# .bash_profile.
# 
# This mess can be avoided by just sourcing .bashrc from here to have it execute every time.

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
