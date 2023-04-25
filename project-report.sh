#!/bin/env bash
#
# project-report
#
# This script counts the number of lines and words in a project.
#
# Author: Fábio Berbert de Paula <fberbert@gmail.com>
#

# configure the project root, extensions and ignore directories
project_root="/home/fabio/projetos/alexa-bolada-platform"
extensions=("*.js" "*.jsx" "*.html" "*.css")
ignore_dirs=("node_modules")

# building the expression to find the files with the desired extensions
ext_expr=""
for ext in "${extensions[@]}"; do
    if [ -z "$ext_expr" ]; then
        ext_expr="-iname \"$ext\""
    else
        ext_expr="$ext_expr -o -iname \"$ext\""
    fi
done

# function to check if the file path should be ignored
should_ignore() {
    local file_path=$1
    for ignore_dir in "${ignore_dirs[@]}"; do
        if [[ $file_path == *"$ignore_dir"* ]]; then
            return 0
        fi
    done
    return 1
}

# counting lines and words
lines=0
words=0
while IFS= read -r -d $'\0' file; do
    if ! should_ignore "$file"; then
        file_lines_words=$(grep -ve '^$' "$file" | awk '{ lines++; words += NF } END { print lines, words }')
        lines=$((lines + $(echo $file_lines_words | cut -d' ' -f1)))
        words=$((words + $(echo $file_lines_words | cut -d' ' -f2)))
    fi
done < <(eval "find \"$project_root\" -type f \( $ext_expr \) -print0")

# printing the result
echo "Lines:" $lines "Words:" $words
