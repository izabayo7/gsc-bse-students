#!/usr/bin/env bash

# function for application loader
function load {
  for i in {1..10}; do
    echo -n "."
    sleep 0.1
  done
  echo -e "100%\n"
} 

echo -e "\n\n***************** Welcome To Bachlor of Software   Engineering cohort list of  Students ***************\n"

echo -n "starting App"
load

export file_path="Students-list_1023.txt"

# function to view all students
function view_student {
  # Check if the file exists
  if [ -f "$file_path" ]; then
    # check if file is empty
    if [ -s "$file_path" ]; then
      # message
      echo -e "\n\n \t\t\t*** Viewing All Students ***\n\n\n"
      # display students
      cat "$file_path"
      # and also call restart the app for user to choose other
      ./main.sh
    else
      echo "No Student Found. Try Adding New Students."
      echo -e "\n\n **** returning to Home **** \n\n"
      # call the load function
      load
      # clear everything and restart the app for user
      clear
      ./main.sh
    fi
  else
    echo "File Not Found."
    echo -e "\n\n **** returning to Home **** \n\n"
    load
    clear
    ./main.sh
  fi
}

#------------------------function to exit program 
function exit_main {
    # Send message for closing app
    echo -n "Closing App. Please wait for a few seconds to finish..."
    sleep 0.6
    clear
    # Kill the main process
    pkill -f './main.sh'
}

# App menu
echo -e "\n\n*******************************************************"
echo -e "****************** Welcome to our App *****************"
echo -e "*******************************************************\n"

echo -e "What would you like to do today?\n"

echo "╔═══════════════════════════════════════════════════╗"
echo "║                  Main Menu                        ║"
echo "╠═══════════════════════════════════════════════════╣"
echo "║    1. Add New Student                             ║"
echo "║    2. View All Students                           ║"
echo "║    3. Update Student                              ║"
echo "║    4. Delete Student                              ║"
echo "║    5. Save Student Emails Sorted in ASC           ║"
echo "║    6. View All Emails Only in ASC Order           ║"
echo "║    7. Backup your data                            ║"
echo "║    8. Exit                                        ║"
echo "╚═══════════════════════════════════════════════════╝"

echo -e "\nEnter your choice (1-8): "

# Allow the user to input their choice with read function
echo -e "\n"
read -p "Enter Your choice Here: " choice
echo -e "\n"

# Switch case to call functions according to user need
case $choice in
    1)
        # register
        ;;
    2)
        view_student
        ;;
    3)
        # update_student
        ;;
    4)
        # delete_student
        ;;
    5)
        # email_save
        ;;
    6)
        # view_email
        ;;
    7)
        # back_up
        ;;
    8)
        # exit_main
        ;;
    *)
        echo "Invalid choice. Please try again."
        ./main.sh
        ;;
esac

