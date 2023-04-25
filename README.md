# project-report

This script counts the number of lines and words in a project.

## Author

Fábio Berbert de Paula \<fberbert@gmail.com>

## Usage

1. Configure the `project_root`, `extensions`, and `ignore_dirs` variables in the script:

```bash
project_root="/path/to/your/project"
extensions=("*.js" "*.jsx" "*.html" "*.css")
ignore_dirs=("node_modules")
```

* `project_root`: The path to the root directory of your project.
* `extensions`: An array of file extensions to include in the search.
* `ignore_dirs`: An array of directory names to ignore in the search.

2. Make the script executable:

```bash
chmod +x project-stats.sh
```

Run the script:

```bash
./project-stats.sh
```

The script will output the number of lines and words in your project, excluding the specified ignore directories.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
