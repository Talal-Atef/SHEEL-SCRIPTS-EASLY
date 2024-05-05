#!/bin/bash

DB_FILE="database.txt"

initialize_database() {
    touch "$DB_FILE"
    echo "Database initialized."
}

insert_data() {
    local id="$1"
    local name="$2"
    
    # Check if ID already exists
    if grep -q "^$id," "$DB_FILE"; then
        echo "Error: ID already exists."
    else
        echo "$id,$name" >> "$DB_FILE"
        echo "Data inserted."
    fi
}

display_data() {
    echo "ID,Name"
    cat "$DB_FILE"
}

search_data() {
    read -p "Enter search term: " search_term
    grep -i "$search_term" "$DB_FILE" || echo "No matching records found."
}

delete_data() {
    read -p "Enter ID to delete: " id
    if grep -q "^$id," "$DB_FILE"; then
        sed -i "/^$id,/d" "$DB_FILE"
        echo "Record with ID $id deleted."
    else
        echo "Error: ID not found."
    fi
}

update_data() {
    read -p "Enter ID to update: " id
    if grep -q "^$id," "$DB_FILE"; then
        read -p "Enter new name: " new_name
        sed -i "s/^$id,.*/$id,$new_name/" "$DB_FILE"
        echo "Record with ID $id updated."
    else
        echo "Error: ID not found."
    fi
}

# Main menu
while true; do
    echo "Advanced DBMS Menu"
    echo "1. Initialize Database"
    echo "2. Insert Data"
    echo "3. Display Data"
    echo "4. Search Data"
    echo "5. Delete Data"
    echo "6. Update Data"
    echo "7. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) initialize_database ;;
        2) read -p "Enter ID: " id
           read -p "Enter Name: " name
           insert_data "$id" "$name" ;;
        3) display_data ;;
        4) search_data ;;
        5) delete_data ;;
        6) update_data ;;
        7) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Please choose again." ;;
    esac
done
