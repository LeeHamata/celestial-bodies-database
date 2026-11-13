#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
fi


SECRET=$(( RANDOM % 1000 + 1))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"
read GUESS

while [[ $GUESS != $SECRET ]]
do
  GUESSES=$(( GUESSES + 1))

if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
  echo "That is not an integer, guess again:"
elif [[ $GUESS -gt $SECRET ]]
then
  echo "It's lower than that, guess again:"
else
  echo "It's higher than that, guess again:"
fi

read GUESS

done

GUESSES=$(( GUESSES + 1 ))

GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
BEST=$($PSQL "UPDATE users SET best_game = $GUESSES WHERE username = '$USERNAME' AND (best_game IS NULL OR best_game > $GUESSES)")
echo "You guessed it in $GUESSES tries. The secret number was $SECRET. Nice job!"



