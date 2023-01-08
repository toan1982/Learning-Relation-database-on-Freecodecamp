#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"
# check if $1 exist
if [[ $1 ]]
then
  # check if $1 is number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # get info from three tables 
    GET_INFO=$($PSQL "select * from properties inner join elements using(atomic_number) inner join types using(type_id) where atomic_number=$1 ")
    # if not found
    if [[ -z $GET_INFO ]]
    then
      echo "I could not find that element in the database."
    else  
      echo "$GET_INFO" | while IFS="|" read type_id atomic_number mass melting boiling symbol name type
      do
        # display output
        echo  "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting celsius and a boiling point of $boiling celsius."   
      done
    fi
  else
    # get info from three tables
    GET_INFO=$($PSQL "select * from properties inner join elements using(atomic_number) inner join types using(type_id) where name='$1' or symbol='$1'")
    # if not found
    if [[ -z $GET_INFO ]]
    then
      echo "I could not find that element in the database."
    else  
      echo "$GET_INFO" | while IFS="|" read type_id atomic_number mass melting boiling symbol name type
      do
        # display output
        echo  "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting celsius and a boiling point of $boiling celsius."   
      done
    fi
  fi
else
  echo -e "Please provide an element as an argument."
fi
