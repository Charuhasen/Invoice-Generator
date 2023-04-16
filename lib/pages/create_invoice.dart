import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateInvoice extends StatefulWidget {
  const CreateInvoice({super.key});

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}

class _CreateInvoiceState extends State<CreateInvoice> {
  //Text Editing Cntroller
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController suppliersTINController = TextEditingController();
  TextEditingController dateOfSupplyController = TextEditingController();
  TextEditingController customerTINController = TextEditingController();
  TextEditingController dateOfInvoiceController = TextEditingController();
  //Product Text Controller
  TextEditingController quantityOneController = TextEditingController();
  TextEditingController descriptionOneController = TextEditingController();
  TextEditingController unitPriceOneController = TextEditingController();
  TextEditingController amountOneController = TextEditingController();
  //
  TextEditingController quantityTwoController = TextEditingController();
  TextEditingController descriptionTwoController = TextEditingController();
  TextEditingController unitPriceTwoController = TextEditingController();
  TextEditingController amountTwoController = TextEditingController();
  //
  TextEditingController quantityThreeController = TextEditingController();
  TextEditingController descriptionThreeController = TextEditingController();
  TextEditingController unitPriceThreeController = TextEditingController();
  TextEditingController amountThreeController = TextEditingController();
  //
  TextEditingController quantityFourController = TextEditingController();
  TextEditingController descriptionFourController = TextEditingController();
  TextEditingController unitPriceFourController = TextEditingController();
  TextEditingController amountFourController = TextEditingController();
  //
  TextEditingController quantityFiveController = TextEditingController();
  TextEditingController descriptionFiveController = TextEditingController();
  TextEditingController unitPriceFiveController = TextEditingController();
  TextEditingController amountFiveController = TextEditingController();
  //
  TextEditingController termsOfPaymentController = TextEditingController();

  void _showDatePicker(TextEditingController nameOfController) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(4000),
    ).then((value) {
      setState(() {
        String day = value!.day.toString();
        String month = value.month.toString();
        String year = value.year.toString();
        nameOfController.text = "$day/$month/$year";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Invoice"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: TextFormField(
                  controller: invoiceNumberController,
                  decoration: const InputDecoration(
                    labelText: "Inv Number: ",
                    border: OutlineInputBorder(),
                    enabled: false,
                  ),
                ),
              ),
              /////
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: toController,
                      decoration: const InputDecoration(
                        labelText: "To: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: suppliersTINController,
                      decoration: const InputDecoration(
                        labelText: "Suppliers TIN: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              ///////
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: dateOfSupplyController,
                      decoration: InputDecoration(
                        hintText: "Date of Supply",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _showDatePicker(dateOfSupplyController);
                          },
                          icon: const Icon(Icons.date_range),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: customerTINController,
                      decoration: const InputDecoration(
                        labelText: "Customer TIN: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              //////
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: TextField(
                  controller: dateOfInvoiceController,
                  decoration: InputDecoration(
                    hintText: "Date of Invoice: ",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _showDatePicker(dateOfInvoiceController);
                      },
                      icon: const Icon(Icons.date_range),
                    ),
                  ),
                ),
              ),
              //////
              const SizedBox(
                height: 30,
              ),
              //Product One
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: quantityOneController,
                      decoration: const InputDecoration(
                        labelText: "Quantity: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: descriptionOneController,
                      decoration: const InputDecoration(
                        labelText: "Description: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: unitPriceOneController,
                      decoration: const InputDecoration(
                        labelText: "Unit Price: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: amountOneController,
                      decoration: const InputDecoration(
                        labelText: "Amount: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              //////
              const SizedBox(
                height: 30,
              ),
              //Product Two
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: quantityTwoController,
                      decoration: const InputDecoration(
                        labelText: "Quantity: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: descriptionTwoController,
                      decoration: const InputDecoration(
                        labelText: "Description: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: unitPriceTwoController,
                      decoration: const InputDecoration(
                        labelText: "Unit Price: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: amountTwoController,
                      decoration: const InputDecoration(
                        labelText: "Amount: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              //////
              const SizedBox(
                height: 30,
              ),
              //Product Three
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: quantityThreeController,
                      decoration: const InputDecoration(
                        labelText: "Quantity: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: descriptionThreeController,
                      decoration: const InputDecoration(
                        labelText: "Description: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: unitPriceThreeController,
                      decoration: const InputDecoration(
                        labelText: "Unit Price: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: amountThreeController,
                      decoration: const InputDecoration(
                        labelText: "Amount: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              //////
              const SizedBox(
                height: 30,
              ),
              //Product Four
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: quantityFourController,
                      decoration: const InputDecoration(
                        labelText: "Quantity: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: descriptionFourController,
                      decoration: const InputDecoration(
                        labelText: "Description: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: unitPriceFourController,
                      decoration: const InputDecoration(
                        labelText: "Unit Price: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: amountFourController,
                      decoration: const InputDecoration(
                        labelText: "Amount: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              //////
              const SizedBox(
                height: 30,
              ),
              //Product Five
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: quantityFiveController,
                      decoration: const InputDecoration(
                        labelText: "Quantity: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: descriptionFiveController,
                      decoration: const InputDecoration(
                        labelText: "Description: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: unitPriceFiveController,
                      decoration: const InputDecoration(
                        labelText: "Unit Price: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: amountFiveController,
                      decoration: const InputDecoration(
                        labelText: "Amount: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: TextFormField(
                  controller: termsOfPaymentController,
                  decoration: const InputDecoration(
                    labelText: "Terms of Payment: ",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Generate"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
