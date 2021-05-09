#!/usr/bin/bash
user=$(cat db.csv)

for j in $user
do
if id $j &> /dev/null
then
        echo "$j Exists"
else
  if useradd $j
  then
          echo "User $j created"
  else
          echo "user $j creation failed"
  fi
fi
done
