#!/bin/bash

PSQL="psql -X -U freecodecamp salon --tuples-only -c"

echo -e '\n~~~~~ Salon ~~~~~\n'

$ get services available
SERVICES_OFFERED="$($PSQL "SELECT * FROM  services")"

SALON_MENU() {
  # display services list
  if [[ -n $1 ]]
  then
    echo $1
  fi
  echo 'Select a service to schedule:'
  
  echo "$SERVICES_OFFERED" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo -e "\t$SERVICE_ID) $SERVICE_NAME"
  done
  # ask for service
  read SERVICE_ID_SELECTED
  # if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    SALON_MENU 'That is not a valid service number.'
  else
    # check if the selected service is valid
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    # if not found
    if [[ -z $SERVICE_NAME ]]
    then
      # send to main menu
      SALON_MENU 'Please select a service from the list'
    else
      # ask for phone number
      echo -e "\nWhat's your phone number?"
      read CSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      # check if customer exists
      if [[ -z $CUSTOMER_NAME ]]
      then
        # ask for name
        echo -e "\nIt's your first appointment here. What's your name?"
        read CUSTOMER_NAME
        # insert into customers
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      fi
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      # ask for appointment time
      echo -e "\nWhat time do you want your appointment, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
      read SERVICE_TIME
      # create appointment
      INSERT_APPT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      if [[ -n INSERT_APPT_RESULT ]]
      then
        echo "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
      fi
    fi
  fi
}


SALON_MENU
