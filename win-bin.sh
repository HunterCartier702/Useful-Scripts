#!/usr/bin/env bash

cat << 'EOF'
   _______  _______ 
  | ____\ \/ / ____|
  |  _|  \  /|  _|  
 _| |___ /  \| |___ 
(_)_____/_/\_\_____|


EOF

read -p "Enter C file for compiling to EXE: " file
new=$(echo "$file" | cut -d. -f1)
echo "x86_64-w64-mingw32-gcc -o $new.exe $file"
x86_64-w64-mingw32-gcc -o $new.exe $file
