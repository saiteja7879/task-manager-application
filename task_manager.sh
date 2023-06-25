# Task Manager Application
#
# Author: Sai Phani Teja Chilukuri
# GitHub: saiphaniteja-chilukuri

# Function to add a new task
add_task() {
    local task_id=$1
    local description=$2
    local completed=false

    echo "$task_id|$description|$completed" >> tasks.txt
}

# Function to mark a task as completed
mark_task_completed() {
    local task_id=$1

    # Read tasks from the file and update the completed status
    sed -i "s/^$task_id|.*$/&|true/" tasks.txt
}

# Function to display all tasks
display_tasks() {
    local tasks_file="tasks.txt"

    if [[ -s "$tasks_file" ]]; then
        while IFS='|' read -r task_id description completed; do
            status="Incomplete"
            [[ "$completed" == "true" ]] && status="Completed"
            echo "Task ID: $task_id"
            echo "Description: $description"
            echo "Status: $status"
            echo
        done < "$tasks_file"
    else
        echo "No tasks found."
    fi
}

# Main menu
while true; do
    echo "Task Manager Application"
    echo "1. Add Task"
    echo "2. Mark Task as Completed"
    echo "3. Display Tasks"
    echo "0. Exit"
    read -p "Enter your choice: " choice
    echo

    case $choice in
        1)
            read -p "Enter task ID: " task_id
            read -p "Enter task description: " description
            add_task "$task_id" "$description"
            echo "Task added successfully."
            echo
            ;;
        2)
            read -p "Enter task ID to mark as completed: " task_id
            mark_task_completed "$task_id"
            echo "Task marked as completed."
            echo
            ;;
        3)
            display_tasks
            ;;
        0)
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            echo
            ;;
    esac
done
#fixing a typo for pull request

