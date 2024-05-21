import 'package:flutter/material.dart';

class MainViewMedicilInventory extends StatefulWidget {
  const MainViewMedicilInventory({super.key});

  @override
  State<MainViewMedicilInventory> createState() =>
      _MainViewMedicilInventoryState();
}

class _MainViewMedicilInventoryState extends State<MainViewMedicilInventory> {
  List<Drug> drugs = [
    Drug(
      'Paracetamol',
      'Used to treat pain and fever.',
      50,
      DateTime(2023, 12, 31),
      'samsoung',
    ),
    Drug(
      'Amoxicillin',
      'Used to treat bacterial infections.',
      30,
      DateTime(2024, 6, 30),
      'samsoung',
    ),
    Drug(
      'Loratadine',
      'Used to treat allergies.',
      20,
      DateTime(2023, 8, 15),
      'samsoung',
    ),
  ];

  List<Drug> filteredDrugs = [];

  TextEditingController searchController = TextEditingController();
  TextEditingController name_drag_Controller = TextEditingController();
  TextEditingController description_drag_Controller = TextEditingController();
  TextEditingController quantity_drag_Controller = TextEditingController();
  TextEditingController expiryDate_drag_Controller = TextEditingController();
  TextEditingController company_drag_Controller = TextEditingController();

  @override
  void initState() {
    filteredDrugs = drugs;
    super.initState();
  }

  void _showEditDrugDialog(Drug drug) {
    name_drag_Controller.text = drug.name;
    description_drag_Controller.text = drug.description;
    quantity_drag_Controller.text = drug.quantity.toString();
    expiryDate_drag_Controller.text = drug.expiryDate.toIso8601String();
    company_drag_Controller.text = drug.company;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('مستودع الأدوية '),
      //   backgroundColor: Colors.cyan,
      // ),
      body: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(50),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                label: const Text('البحث عن دواء'),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  filteredDrugs = drugs
                      .where((drug) =>
                          drug.name.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),

          // TextField(
          //   controller: searchController,
          //   decoration: InputDecoration(
          //     labelText: 'Search for a drug',
          //   ),
          //   onChanged: (value) {
          //     setState(() {
          //       filteredDrugs = drugs
          //           .where((drug) =>
          //           drug.name.toLowerCase().contains(value.toLowerCase()))
          //           .toList();
          //     });
          //   },
          // ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              itemCount: drugs.length,
              itemBuilder: (context, index) {
                return Container(
                  color: index % 2 == 0 ? Colors.grey[100] : Colors.white,
                  child: ListTile(
                    title: Text(drugs[index].name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('الوصف: ${drugs[index].description}'),
                        Text('الكمية: ${drugs[index].quantity}'),
                        Text(
                            'تاريخ الانتهاء: ${drugs[index].expiryDate.toString()}'),
                        Text('الشركة المصنعة : ${drugs[index].company}'),
                      ],
                    ),
                    trailing: IconButton(
                        icon: const Icon(Icons.mode_edit_outline_outlined),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Edit Drug'),
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          controller: name_drag_Controller,
                                          decoration: InputDecoration(
                                              labelText: 'Drug Name'),
                                        ),
                                        TextFormField(
                                          controller: description_drag_Controller,
                                          decoration: InputDecoration(
                                              labelText: 'Description'),
                                        ),
                                        TextFormField(
                                          controller: quantity_drag_Controller,
                                          decoration: InputDecoration(
                                              labelText: 'Quantity'),
                                        ),
                                        TextFormField(
                                          controller: expiryDate_drag_Controller,
                                          decoration: InputDecoration(
                                              labelText: 'Expiry Date'),
                                        ),
                                        TextFormField(
                                          controller: company_drag_Controller,
                                          decoration: InputDecoration(
                                              labelText: 'Company'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // Update the drug information
                                      // setState(() {
                                      // drug.name = name_drag_Controller.text;
                                      // drug.description = description_drag_Controller.text;
                                      // drug.quantity = int.parse(quantity_drag_Controller.text);
                                      // drug.expiryDate = DateTime.parse(expiryDate_drag_Controller.text);
                                      // drug.company = company_drag_Controller.text;
                                      // });
                                      // Dismiss the dialog
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Save'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Dismiss the dialog without saving changes
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                        }),
                    // onTap: () {
                    //   // Edit drug functionality goes here
                    //   // You can show a dialog or navigate to a new screen to edit the drug details
                    // },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // ... (الكود السابق)

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // String name;
              // String description;
              // int quantity;
              // DateTime expiryDate;
              // String company;
              return AlertDialog(
                title: const Text('إضافة دواء جديد '),
                content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: name_drag_Controller,
                          decoration:
                              const InputDecoration(labelText: 'الاسم '),
                          onChanged: (value) {
                            String name = value;
                          },
                        ),
                        TextField(
                          controller: description_drag_Controller,
                          decoration: const InputDecoration(labelText: 'الوصف'),
                          onChanged: (value) {
                            String description = value;
                          },
                        ),
                        TextField(
                          controller: quantity_drag_Controller,
                          decoration:
                              const InputDecoration(labelText: 'الكمية '),
                        //  keyboardType: TextInputType.number,
                          onChanged: (value) {
                            int quantity = value as int;
                          },
                        ),
                        TextField(
                          controller: expiryDate_drag_Controller,
                          decoration: const InputDecoration(
                              labelText: 'تاريخ الانتهاء(YYYY-MM-DD)'),
                      //    keyboardType: TextInputType.datetime,
                          onChanged: (value) {
                            DateTime expiryDate = DateTime.parse(value);
                          },
                        ),
                        TextField(
                          controller: company_drag_Controller,
                          decoration: const InputDecoration(
                              labelText: 'الشركة المصنعة'),
                          onChanged: (value) {
                            String company = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('إلغاء'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('إضافة'),
                    onPressed: () {
                      setState(() {
                        drugs.add(Drug(
                          name_drag_Controller.text,
                          description_drag_Controller.text,
                          int.parse(quantity_drag_Controller.text),
                          DateTime.parse(expiryDate_drag_Controller.text),
                          company_drag_Controller.text,
                        ));
                        filteredDrugs = drugs;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),

// ... (الكود السابق)
    );
  }
}

class Drug {
  String name;
  String description;
  int quantity;
  DateTime expiryDate;
  String company;

  Drug(this.name, this.description, this.quantity, this.expiryDate,
      this.company);
}
