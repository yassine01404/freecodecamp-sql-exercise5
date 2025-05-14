#!/bin/bash

#guessing game

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
secret_number=$((1 + RANDOM % 1000))
number_of_guesses=0
games_played=0
best_game=0

echo "Enter your username:"
read username

user_id=$($PSQL "select user_id from users where username='$username'")
if [[ -z $user_id ]]
then
  echo "Welcome, $username! It looks like this is your first time here."
  add_user=$($PSQL "insert into users (username) values ('$username')")
  user_id=$($PSQL "select user_id from users where username='$username'")
else
  games_played=$($PSQL "select games_played from users where user_id=$user_id")
  best_game=$($PSQL "select best_game from users where user_id=$user_id")
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read number
while [[ ! $number =~ ^[0-9]+$ ]] 
do
  echo "That is not an integer, guess again:"
  read number
done
number_of_guesses=$((number_of_guesses + 1))
while [[ ! number -eq secret_number ]]
do
  if [[ number -gt secret_number ]]
  then
    echo "It's lower than that, guess again:"
    read number
    while [[ ! $number =~ ^[0-9]+$ ]] 
    do
      echo "That is not an integer, guess again:"
      read number
    done
    number_of_guesses=$((number_of_guesses + 1))
  else
    echo "It's higher than that, guess again:"
    read number
    while [[ ! $number =~ ^[0-9]+$ ]] 
    do
      echo "That is not an integer, guess again:"
      read number
    done
    number_of_guesses=$((number_of_guesses + 1))
  fi
done
games_played=$((games_played + 1))
add_game=$($PSQL "update users set games_played=$games_played where user_id=$user_id")
if [[ $best_game -eq 0 ]]
then
  update_best_game=$($PSQL "update users set best_game=$number_of_guesses where user_id=$user_id")
else
  if [[ $best_game -gt $number_of_guesses ]]
  then
    update_best_game=$($PSQL "update users set best_game=$number_of_guesses where user_id=$user_id")
  fi
fi
echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
