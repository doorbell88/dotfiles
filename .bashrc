#------------------------------------ PATH -------------------------------------
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/bin
export PATH=$PATH:~/Desktop/Programming/Scripting


#-------------------------------- PYTHON PATH ----------------------------------
###  THE ONLY REASON TO SET $PYTHONPATH IS MAINTAIN DIRECTORIES OF CUSTOM PYTHON
###  LIBRARIES THAT YOU DO NOT WANT INSTALLED IN THE GLOBAL DEFAULT LOCATION
###  NOTE --> the default python $(which python) is --> /usr/bin/python
###  (i.e. THE "site-packages" directory)

#PYTHONPATH=/usr/local/lib/python2.7/site-packages

# NEVER TOUCH THIS... I think... :
#PYTHONPATH=$PYTHONPATH:/System/Library/Frameworks/Python.framework/Versions/Current/lib/python2.7/

#export PYTHONPATH
#export PATH=$PYTHONPATH:$PATH


#-------- PYTHON 3 -----------------------------------------
# Setting PATH for Python 3.5
#PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.5/bin
#export PATH

# Setting PATH for Python 3.6
#PATH=$PATH:~/Library/Python/3.6/bin
#export PATH


##-------- VIRTUALENV ---------------------------------------
###  MAKE NEW VIRTUALENV :  virtualenv env_name
###  WORK ON VIRTUALENV  :  source ~/virtualenvs/env_name/default/bin/activate
###  STOP WORKING ON VENV:  deactivate


##-------- VIRTUALENVWRAPPER --------------------------------
## Virtualenvwrapper setup
#export WORKON_HOME=$HOME/virtualenvs
#export PATH=$PATH:$HOME/Library/Python/2.7/site-packages
#
## For defining (globally) the python interpreter to use (--> which is better?)
##export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
#export VIRTUALENVWRAPPER_VIRTUALENV=/Library/Python/2.7/site-packages/virtualenv
#
## Source the virtualenvwrapper.sh script
#source /usr/local/bin/virtualenvwrapper.sh
