import 'package:hive_flutter/hive_flutter.dart';

class GetSaveDirectory {
  //Reference box

  final localStorage = Hive.box('local_data');

  //Write path

  void setPath(String saveDirectory) {
    localStorage.put('save_directory', saveDirectory);
  }

  //Get Path

  Future<String> getPath() async {
    String saveDirectory = "Please set directory...";
    saveDirectory = await localStorage.get('save_directory');
    return saveDirectory;
  }
}
