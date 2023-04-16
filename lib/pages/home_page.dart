import 'package:get/get.dart';
import 'package:invoice_generator/pages/create_invoice.dart';
import 'package:invoice_generator/pages/login.dart';
import 'package:invoice_generator/pages/settings_page.dart';
import '../constants.dart' as constants;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(constants.Constants.COMPANY_NAME)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(constants.Constants.COMPANY_NAME),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Get.to(const SettingsPage());
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Get.offAll(const LoginPage());
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: const Text("HomePage"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(const CreateInvoice());
        },
      ),
    );
  }
}
