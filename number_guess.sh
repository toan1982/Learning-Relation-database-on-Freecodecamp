#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess  -t --no-align -c"

# generate a random number
secret_number=$(( RANDOM % 1000 + 1 ))
TOTAL_GUESS=0
NUMBER_OF_GUESSES() {
 ((++TOTAL_GUESS))
}
echo "Enter your username:"
read NAME
# get user_id
GET_ID=$($PSQL "select user_id from  users where name='$NAME'")
# if not found
if [[ -z $GET_ID ]]
then
  # insert name
  INSERT_NAME=$($PSQL "insert into users(name) values('$NAME')")
  # get new ID
  GET_NEW_ID=$($PSQL "select user_id from  users where name='$NAME'")
  # update records table
  INSERT_RECORD=$($PSQL "insert into records(user_id,played_times,number_of_guesses) values($GET_NEW_ID,1,0)")
  echo "Welcome, $NAME! It looks like this is your first time here."
  echo "Guess the secret number between 1 and 1000:"
  read input_num
  #read input_num
  NUMBER_OF_GUESSES
  #compare input_num and secret_number
  while [ $input_num != $secret_number ]
  do
    if [[ ! $input_num =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:" 
      read input_num
      NUMBER_OF_GUESSES
    else
      if [[ $input_num > $secret_number ]]
      then
        # count number of guesses
        echo "It's lower than that, guess again:" 
        read input_num
        NUMBER_OF_GUESSES
      # read input_num
      elif [[ $input_num < $secret_number ]]
      then
        # count number of guesses
        echo "It's higher than that, guess again:" 
        read input_num
        NUMBER_OF_GUESSES
      fi
    fi
  done
  if [[ $input_num == $secret_number ]]
  then
    echo "You guessed it in $TOTAL_GUESS tries. The secret number was $secret_number. Nice job!"
  fi
  # update records table
  INSERT_RECORD=$($PSQL "update records set number_of_guesses=$TOTAL_GUESS where user_id=$GET_NEW_ID")
  #--------------------------------------------------------------------------------------------------
else
  GAMES_PLAYED=$($PSQL "select count(*) from records where user_id=$GET_ID")
  BEST_GAME=$($PSQL "select min(number_of_guesses) from records where user_id=$GET_ID")
  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  #------------------------------
  echo "Guess the secret number between 1 and 1000:"
  read input_num
  NUMBER_OF_GUESSES
  #compare input_num and secret_number
  while [ $input_num != $secret_number ]
  do
    if [[ ! $input_num =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:" 
      read input_num
      NUMBER_OF_GUESSES
    else
      if [[ $input_num > $secret_number ]]
      then
        # count number of guesses
        echo "It's lower than that, guess again:" 
        read input_num
        NUMBER_OF_GUESSES
      # read input_num
      elif [[ $input_num < $secret_number ]]
      then
        # count number of guesses
        echo "It's higher than that, guess again:" 
        read input_num
        NUMBER_OF_GUESSES
        #read input_num
      fi
    fi
  done
  if [[ $input_num == $secret_number ]]
  then
    echo "You guessed it in $TOTAL_GUESS tries. The secret number was $secret_number. Nice job!"
  fi
  # update records table
  ((++GAMES_PLAYED))
  INSERT_RECORD=$($PSQL "insert into records(user_id,played_times,number_of_guesses) values($GET_ID,$GAMES_PLAYED,$TOTAL_GUESS)")
fi
