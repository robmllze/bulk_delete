import 'dart:io';
import 'dart:io' show Platform;
import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:args/args.dart';
import 'package:glob/glob.dart';

void main(List<String> arguments) {
  final parser = ArgParser();
  parser.addOption("dir", abbr: "d", help: "The directory to search in");
  parser.addOption("folders", abbr: "f", help: "The regex pattern for folders to delete");
  parser.addOption("files", abbr: "i", help: "The regex pattern for files to delete");
  parser.addFlag("verbose", abbr: "v", help: "Verbose output");
  parser.addFlag("dry-run", abbr: "n", help: "Dry run (no files will be deleted)");

  final args = parser.parse(arguments);

  final dir = Directory(args["dir"]);
  final foldersRegex = args["folders"] != null ? RegExp(args["folders"]) : null;
  final filesRegex = args["files"] != null ? RegExp(args["files"]) : null;
  final isVerbose = args["verbose"] == true;
  final isDryRun = args["dry-run"] == true;

  // Get all files and directories in the specified directory
  final files = dir.listSync(recursive: true);

  // Loop through all files and directories
  for (var file in files) {
    if (file is File && filesRegex != null && filesRegex.hasMatch(p.basename(file.path))) {
      final filePath = file.path;
      if (isVerbose) {
        print("Deleting file: $filePath");
      }
      if (!isDryRun) {
        file.deleteSync();
      }
    } else if (file is Directory &&
        foldersRegex != null &&
        foldersRegex.hasMatch(p.basename(file.path))) {
      final dirPath = file.path;
      if (isVerbose) {
        print("Deleting directory: $dirPath");
      }
      if (!isDryRun) {
        file.deleteSync(recursive: true);
      }
    }
  }
}
