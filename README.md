# lowercase_yaml_keys

```
#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]
then
    echo "Usage: $0 input.yaml"
    exit 1
fi

# Convert all the keys to lowercase
awk 'BEGIN { FS=": *"; OFS=": " } /^[^#]/ { $1=tolower($1) } { print }' "$1" > "${1}.tmp"

# Replace the original file with the modified file
mv "${1}.tmp" "$1"
```
To use this script, save it to a file (e.g., lowercase_yaml_keys.sh) and make it executable (chmod +x lowercase_yaml_keys.sh). Then, run it with the path to the YAML file as an argument:

```
./lowercase_yaml_keys.sh input.yaml
```

This script uses awk to read the input file and modify all the keys to lowercase. The modified file is written to a temporary file, which is then renamed to the original file. The script only modifies keys that are not commented out (i.e., do not start with #).
