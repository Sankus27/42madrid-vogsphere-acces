# 42madrid Remote Vogsphere Access Setup
##Setup Kerberos &amp; Git access to 42madrid
### version optimiced by "malonso-"

To setup access to your git repos on vogsphere, (only works on LInux / OSX)

####Clone this repo

####Run the shell script 
	
	sudo sh run.sh

(Enter system password if you need sudo previleges)

####Get your kerberos ticket

	kinit xloginx

(xloginx represents your login id)

####Enter your 42 password when asked to successfull authenticate.

####Clone/Push/Pull from all the Vogsphere Git repos you have access to. 

####To close your connection :

    kdestroy


### You can now access your vogsphere outside the 42 clusters
