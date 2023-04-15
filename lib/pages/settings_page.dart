import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/local_storage/get_save_directory.dart';
import 'package:invoice_generator/local_storage/tax_values.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? saveDirectory;
  double? nhlValue;
  double? getFundLevy;
  double? covidLevy;
  double? vat;

  @override
  void initState() {
    super.initState();
    setSavedDirectory();
    getTAXValue();
  }

  void setSavedDirectory() async {
    saveDirectory = await GetSaveDirectory().getPath();
    setState(() {});
  }

  void getTAXValue() async {
    nhlValue = await TAXValues().getNHL();
    getFundLevy = await TAXValues().getGetFundLevy();
    covidLevy = await TAXValues().getCovidLevy();
    vat = await TAXValues().getVAT();
    setState(() {});
  }

  void _requestSaveDirectory() async {
    saveDirectory = await FilePicker.platform.getDirectoryPath();
    GetSaveDirectory().setPath(saveDirectory.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nhlValueController = TextEditingController();
    TextEditingController getFundLevyController = TextEditingController();
    TextEditingController covidController = TextEditingController();
    TextEditingController vatController = TextEditingController();
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
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          //NHL
          const Text(
            "NHL: ",
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
                  controller: nhlValueController,
                  decoration: InputDecoration(
                      labelText: '$nhlValue%',
                      border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextButton(
                  child: const Text("UPDATE"),
                  onPressed: () {
                    setState(() {
                      TAXValues().setNHL(double.parse(nhlValueController.text));
                      getTAXValue();
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          //GetFund Levy
          const Text(
            "GetFund Levy: ",
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
                  controller: getFundLevyController,
                  decoration: InputDecoration(
                      labelText: '$getFundLevy%',
                      border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextButton(
                  child: const Text("UPDATE"),
                  onPressed: () {
                    setState(() {
                      TAXValues().setGetFundLevy(
                          double.parse(getFundLevyController.text));
                      getTAXValue();
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          //Covid 19 Levy
          const Text(
            "COVID-19 Levy: ",
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
                  controller: covidController,
                  decoration: InputDecoration(
                      labelText: '$covidLevy%',
                      border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextButton(
                  child: const Text("UPDATE"),
                  onPressed: () {
                    setState(() {
                      TAXValues()
                          .setCovidLevy(double.parse(covidController.text));
                      getTAXValue();
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          //VAT
          const Text(
            "VAT: ",
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
                  controller: vatController,
                  decoration: InputDecoration(
                      labelText: '$vat%', border: const OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextButton(
                  child: const Text("UPDATE"),
                  onPressed: () {
                    setState(() {
                      TAXValues().setVAT(double.parse(vatController.text));
                      getTAXValue();
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
