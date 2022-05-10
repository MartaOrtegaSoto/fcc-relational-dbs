#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

I=0

STORE_INFO() {
  # if new user
  if [[ -z $USERNAME_RESULT ]] 
  then
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO game_scores(username, games_played, best_game) VALUES ('$USERNAME', 1, $I)")
  else
    # if new best score
    if [[ $I -lt $BEST_GAME ]]
    then
      BEST_GAME=$I
    fi
    UPDATE_GAME_RESULT=$($PSQL "UPDATE game_scores SET games_played = games_played + 1, best_game = $BEST_GAME WHERE username = '$USERNAME'")
  fi
}

READ_GUESS() {
  (( I++ ))
  # Read guess
  echo -e "\n$1"
  read GUESSED_NUMBER
  # if not a number
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then
    READ_GUESS "That is not an integer, guess again:"
  elif [[ $GUESSED_NUMBER -lt $SECRET_NUMBER ]]
  then
    READ_GUESS "It's higher than that, guess again:"
  elif [[ $GUESSED_NUMBER -gt $SECRET_NUMBER ]]
  then
    READ_GUESS "It's lower than that, guess again:"
  elif [[ $GUESSED_NUMBER -eq $SECRET_NUMBER ]]
  then
    echo "ou guessed it in $I tries. The secret number was $SECRET_NUMBER. Nice job!"
    STORE_INFO
  fi
}

START_GAME() {
  # ask for username
  echo 'Enter your username:'
  read USERNAME
  # get user info
  USERNAME_RESULT=$($PSQL "SELECT games_played, best_game FROM game_scores WHERE username = '$USERNAME'")
  # if not found
  if [[ -z $USERNAME_RESULT ]]
  then
    # print welcome message
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  else
    # Array: 0: games_played, 1: |, 2: best_game
    USER_INFO_ARR=($(echo $USERNAME_RESULT | sed 's/|/ /'))
    GAMES_PLAYED=${USER_INFO_ARR[0]}
    BEST_GAME=${USER_INFO_ARR[1]}
    # display username info
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  # generate random number
  SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
  READ_GUESS "Guess the secret number between 1 and 1000:"

}


START_GAME
