import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/local_storage/get_save_directory.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? saveDirectory;

  @override
  void initState() {
    super.initState();
    setSavedDirectory();
  }

  void setSavedDirectory() async {
    saveDirectory = await GetSaveDirectory().getPath();
    setState(() {});
  }

  void _requestSaveDirectory() async {
    saveDirectory = await FilePicker.platform.getDirectoryPath();
    GetSaveDirectory().setPath(saveDirectory.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Save Directory",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: saveDirectory,
                      border: const OutlineInputBorder()),
                  enabled: false,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextButton(
                  child: const Text("UPDATE"),
                  onPressed: () {
                    _requestSaveDirectory();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
