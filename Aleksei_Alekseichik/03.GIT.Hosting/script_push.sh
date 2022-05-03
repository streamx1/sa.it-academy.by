#!/bin/bash
count=1
for param in "$@"
do if [ $param = --all ] ;
	then git remote show | while read name1
				do git push $name1 --all  
				   echo "Push in $name1 completed"
				done
		elif [ $param = -h ] ;
		then echo "Specify one or more git names available with the \"git remote show\" command as parameters.
Use --all to push to all remote gits"
	else git push $param --all && echo "Push in $param completed"
count=$(( $count + 1 ))
fi
done
if [ $# -eq 0 ] ;
then echo "Please use -h option for help"
fi
