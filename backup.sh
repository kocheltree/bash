#!/usr/bin/env bash

# Write a script which:
# Prompts the user for a directory name and then creates it with* mkdir*.
# Changes to the new directory and prints out where it is using *pwd*.
# Using* touch*, creates several empty files and runs *ls* on them to verify they are empty.
# Puts some content in them using *echo* and redirection.
# Displays their content using *cat*.
# Says goodbye to the user and cleans up after itself.
# Click the link below to view a solution to the Lab exercise.

echo $(date): Beginning script... | tee "/tmp/backup-log.txt"
echo $(date): Kernel Version: $(uname -r) | tee "/tmp/backup-log.txt"

echo $(date): What is the name of the directory? | tee -a "/tmp/backup-log.txt"
read DIRNAME

echo $(date): Checking to see if directory exists... | tee -a "/tmp/backup-log.txt"
if [ -d "$DIRNAME" ]; then
echo $(date): Directory exists. Cleaning up... | tee -a "/tmp/backup-log.txt"
rm -R "$DIRNAME"
fi

echo $(date): Creating directory: "$(pwd)/$DIRNAME" | tee -a "/tmp/backup-log.txt"
mkdir $DIRNAME
cd $DIRNAME
echo Now browsing to directory $(pwd)

echo $(date): Please enter a filename prefix: | tee -a "/tmp/backup-log.txt"
read prefix

echo $(date): Generating test files... | tee -a "/tmp/backup-log.txt"
for f in {1..10}
  do touch $prefix_$f
done

echo $(date): $(ls -l) > "dir.txt" | tee -a "/tmp/backup-log.txt"
cat "dir.txt"

echo $(date): Job completed. Cleaning up... | tee -a "/tmp/backup-log.txt"
# cd "$(pwd)/.."
# rm -R $DIRNAME

echo $(date): Would you like to view the log? (y/n)
read answer

if [ "$answer" -eq "y" ]; then
  cat "/tmp/backup-log.txt"
fi

echo $(date): Goodbye. | tee -a "/tmp/backup-log.txt"
