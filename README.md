# bulk_delete.dart

`bulk_delete.dart` is a command-line tool for deleting files and directories in bulk based on regular expression patterns.

## Usage

To use `bulk_delete.dart`, run the following command:

dart bulk_delete.dart --dir /path/to/directory --folders <regex> --files <regex> [--verbose] [--dry-run]


where:

- `--dir` or `-d`: Specifies the directory to search in.
- `--folders` or `-f`: Specifies the regex pattern for folders to delete.
- `--files` or `-i`: Specifies the regex pattern for files to delete.
- `--verbose` or `-v`: Optional. Enables verbose output.
- `--dry-run` or `-n`: Optional. Runs the program in dry-run mode (no files will be deleted).

## Examples

Here are some examples of how to use `bulk_delete.dart`:

// Deletes all folders that match the "old_data" pattern
dart bulk_delete.dart --dir /path/to/directory --folders old_data --verbose

// Deletes all files that match the ".log" extension
dart bulk_delete.dart --dir /path/to/directory --files \.log$ --verbose


## Dependencies

- `path`: For working with file and directory paths.
- `args`: For parsing command-line arguments.
- `glob`: For finding files and directories based on glob patterns.



