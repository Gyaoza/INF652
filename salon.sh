#!/bin/bash


PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

main_menu() { 
  if [[ $1 ]] 
  then 
  echo -e "\n$1"
fi
AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

echo "$AVAILABLE_SERVICES" | while read service_id bar name
do 
echo "$service_id) $name"
done

read SERVICE_ID_SELECTED 

if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
main_menu "That is not a valid number. Try again."

else 
SERVICE_AVAILABLE=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")

if [[ -z $SERVICE_AVAILABLE ]]
then 
main_menu "Service not found. Which service would you like?"
else
appointment_menu
fi
fi
}

appointment_menu() { 
  echo -e "\nWhat is your phone number?"
read CUSTOMER_PHONE 
CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then 
echo -e "\nPhone number not found, let's search another way, what is your name?"
read CUSTOMER_NAME
insert_customer_result=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi
customer_name_formatted=$(echo $CUSTOMER_NAME | sed 's/  //g')
echo -e "\nWhat time would you like your appointment to be?"
read SERVICE_TIME

customer_id=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
insert_appointment_result=$($PSQL "insert into appointments(customer_id, service_id, time) values($customer_id, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

service_name=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
service_name_formatted=$(echo $service_name | sed 's/  //g')
echo -e "\nI have put you down for a  $service_name_formatted at $SERVICE_TIME, $customer_name_formatted."
}

main_menu