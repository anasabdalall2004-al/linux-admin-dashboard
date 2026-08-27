#!/bin/bash
system_info()
{
echo "========================="
echo "System Information"
echo "========================="
echo "Hostname : $(hostname)"
echo " Current User $(whoami)"
echo "Kernal : $(uname -r)"
echo "Operating System : $(uname -s)"
echo "Uptime :"
uptime
echo "Disk Usage :"
df -h | head -5
echo "Memory Usage:"
free -h
}
users_groups()
{
echo "========================"
echo "         Users and Groups"
echo "======================"
echo "Current User : $(whoami)"
echo "User ID and Group ID :"
id
echo "Groupd:"
groups
echo "Number of Users:"
cut -d: -f1 /etc/passwd | wc -l
}
file_manager()
{
echo "=================="
echo " File and Directory Manager"
echo "1. Create File"
echo "2. Create Directory"
echo "3.List File"
echo "4.Delete File"
read -p "Choose [1-4]:" file_choice
case $file_choice in
1)
read -p "Enter file name:" filename
if [ -e "$filename" ]; then
echo "File already exists ."
else 
touch "$filename"
echo "File created succesfuly"
fi
;;
2)
read -p "Enter Directory name:" dirname
if [ -d "$dirname" ]; then
echo "Directory already exists"
else
mkdir "$dirname"
echo "directory created succsfuly"
fi
;;
3)
echo "Files and directorys;"
ls -l
;;
4)
read -p "Enter file name to delete:"filename
if [ -f "$filename" ]; then
rm "$filename"
echo "file deleted succesfuly."
else 
echo "file not found."
fi
;;
*)
echo "Invalid choice."
;;
esac
}
permission_audit()
{
echo "========================="
echo "             permission audit"
echo "===================="
read -p "Enter file or directory path:" path
if [ -e "$path" ]; then
echo "File Information:"
ls -ld "$path"
if [ -r "$path" ];then
echo "Read permission: Yes"
else
echo "Read permission: No"
fi
if [ -w "$path" ]; then
echo "Write permission:Yes"
else
echo "Write permission:No"
fi
if [ -x "$path" ]; then
echo "ececute permission:Yes "
else
echo "ececute permission:No "
fi
else 
echo "Error : File or directory not found."
fi
}

echo "Write permission:No"
text_analyzer()
{
echo "============Text Analyzer========"
read -p "Enter file name: " file
if [ -f "$file" ]; then
echo "Lines: $(ws -l < "$file")"
echo "Words: $(ws -w < "$file")"
read -p "Enter Word to search:" word
grep -in "$word" "$file"
else
echo "Error : File not found."
fi
}
backup_manager()
{
echo "======Backup Manager ======"
read -p "Enter directory name:" dir
if [ -d "$dir" ]; then
tar -czf "${dir}_backup.tar.gz" "$dir"
echo "Backup is Succesfuly"
else
echo "Error : Directory not found."
fi
}
generate_report()
{
echo "============ Generate Report========"
report="System_report.txt"
echo "Linux Admin Dashboard Report"> "$report"
echo "Date : $(date)" >> "$report"
echo "User : $(whoami)" >> "$report"
echo "Hostname : $(hostname)" >> "$report"
echo "Kernal : $(uname -r)" >> "$report"
echo "Disk Usage : " >> "$report"
df -h >> "$report"
echo "Report created: $report"
}




while true 
do 
clear
echo "==========================="
echo "       Linux Admin Dashboard"
echo "==========================="
echo "1. System Information "
echo "2. User and Groups"
echo "3. File and Directory Manager"
echo "4. Premission Audit"
echo "5. Text and Analyzer"
echo "6. Backup Manager"
echo "7. Generate Report"
echo "Exit"
echo "============================"
read -p "Choose an option [1-8]: " choice
case $choice in
1)
   system_info
;;
2)
  users_groups
;;
3)
    file_manager
;;
4)   permission_audit
;;
5)
     text_analyzer
;;
6)
     backup_manager
;;
7)
   generate_report
;;
8)
echo "Goodbye!"
break
;;
*)
echo "Invalid choise. please enter a number from 1 to 8"
;;
esac

 read -p "press enter to continue..."
done





