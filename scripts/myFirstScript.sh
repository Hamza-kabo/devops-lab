#!/bin/bash

#This is my first script

exec > >(tee -a ../logs/myFirstScript.log) 2>&1

echo ".............................................."
echo "Execution Date: $(date)"
echo ".............................................."

echo "Hi my name is Hamza and this is my first script."

#adding some new features

#step 1 check if config folder exists
echo "Step 1 - checking config folder"
ls ../config && echo "Result: Step 1 succeeded" || { echo "Result: Step 1 failed !!"; exit 1; }

#step 2 check disk space
echo "Step 2 - checking disk space..."
df -h && echo "Result: Step 2 succeeded" || { echo "Result: Step 2 failed!!"; exit 2; }

echo "............................................................"
echo "All tasks performed successfully"

echo "cleaning old logs"

#adding a new comment to see how conflict resolution works

tail -n 45 ../logs/myFirstScript.log > ../logs/myFirstScript.log
exit 0
