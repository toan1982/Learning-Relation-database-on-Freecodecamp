#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read year round win lose win_g lose_g
do
  if [[ $win != winner ]]
  then
    #get team_id
    WIN_ID=$($PSQL "select team_id from teams where name='$win'")
    LOSE_ID=$($PSQL "select team_id from teams where name='$lose'")
    #if not found
    if [[ -z $WIN_ID ]]
    then 
      #insert name of team
      INSERT_TEAM=$($PSQL "insert into teams(name) values('$win')")   
      #get new team_id
      WIN_ID=$($PSQL "select team_id from teams where name='$win'")
    fi
    if [[ -z $LOSE_ID ]]
    then 
      #insert name of team
      INSERT_TEAM=$($PSQL "insert into teams(name) values('$lose')")   
      #get new team_id
      LOSE_ID=$($PSQL "select team_id from teams where name='$lose'")
    fi
    #insert data to table games
    INSERT_GAMES=$($PSQL "insert into games(year, round, winner_id, opponent_id,winner_goals, opponent_goals) values($year, '$round', $WIN_ID, $LOSE_ID, $win_g, $lose_g)")
  fi
done