#!/bin/bash

PSQL="psql -X -U freecodecamp periodic_table --tuples-only -c"

SEARCH_ELEMENT() {
if [[ -n $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # search element by atomic_number
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
  else
    # search by symbol or name
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
  fi
  
  # if not found
  if [[ -z $ELEMENT_ID ]]
  then
    echo 'I could not find that element in the database.'
  else
    # get element info
    ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number = $ELEMENT_ID")
    # Element: 0: atomic_number, 1: |, 2: symbol, 3: |, 4: name
    ELEMENT=($ELEMENT_RESULT)
    # get element properties
    PROPERTIES_RESULT=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties WHERE atomic_number = $ELEMENT_ID")
    # Properties: 0: atomic_mass, 1: |, 2: melting_point_celsius, 3: | 4: boiling_point_celsius, 5: |, 6: type_id
    PROPERTIES=($PROPERTIES_RESULT)
    TYPE_ID=${PROPERTIES[6]}
    TYPE_NAME=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
    echo "The element with atomic number ${ELEMENT[0]} is ${ELEMENT[4]} (${ELEMENT[2]}). It's a $(echo $TYPE_NAME | sed 's/ //g'), with a mass of ${PROPERTIES[0]} amu. ${ELEMENT[4]} has a melting point of ${PROPERTIES[2]} celsius and a boiling point of ${PROPERTIES[4]} celsius."
  fi
# search element by
fi
}

# if no parametres
if [[ $# -eq 0 ]]
then
  echo 'Please provide an element as an argument.'
else
  SEARCH_ELEMENT $1
fi
