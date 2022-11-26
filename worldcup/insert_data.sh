#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
#echo $year $round $winner $opponent $winner_goals $opponent_goals

if [[ $opponent != "opponent" && $winner != "winner" ]]
then
  
  # Check if opponent and winner are on teams table
  teams_opponent="$($PSQL "select name from teams where name = '$opponent'")"
  teams_winner="$($PSQL "select name from teams where name = '$winner'")"

  # Insert names in teams table
  if [[ -z $teams_opponent ]]
  then
    echo "$($PSQL "insert into teams(name) values('$opponent')")"
  fi
  if [[ -z $teams_winner ]]
  then
    echo "$($PSQL "insert into teams(name) values('$winner')")"
  fi

  # Insert data in games table
  echo "$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($year, '$round', (select team_id from teams where name = '$winner'), (select team_id from teams where name = '$opponent'), $winner_goals, $opponent_goals)")"

fi

done
