#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # Mostrar servicios disponibles
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  echo -e "\n~~~~ Welcome to the Salon ~~~~\n"

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Solicitar servicio
  echo -e "\nWhat service do you need?"
  read SERVICE_ID_SELECTED

  # Validar que sea un número
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else

    # Comprobar que el servicio exista
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    if [[ -z $SERVICE_NAME ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    else

      # Solicitar teléfono
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      # Buscar cliente
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      # Si el cliente no existe
      if [[ -z $CUSTOMER_NAME ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME

        # Registrar cliente
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi

      # Obtener customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      # Solicitar hora
      echo -e "\nWhat time would you like your cut?"
      read SERVICE_TIME

      # Registrar cita
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

      # Confirmar cita
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/^ *//;s/ *$//') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//;s/ *$//')."

    fi
  fi
}

MAIN_MENU