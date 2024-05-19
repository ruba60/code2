
import 'package:flutter/material.dart';



class MainViewMedicilInventory extends StatefulWidget {
   const MainViewMedicilInventory({super.key});

  @override
  State<MainViewMedicilInventory> createState() => _MainViewMedicilInventoryState();
}

class _MainViewMedicilInventoryState extends State<MainViewMedicilInventory> {
  List<Drug> drugs = [
    Drug('Paracetamol', 'Used to treat pain and fever.', 50, DateTime(2023, 12, 31), 'samsoung',),
    Drug('Amoxicillin', 'Used to treat bacterial infections.', 30, DateTime(2024, 6, 30), 'samsoung',),
    Drug('Loratadine', 'Used to treat allergies.', 20, DateTime(2023, 8, 15), 'samsoung' ,),
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
            padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 50 ),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                label: Text('البحث عن دواء'),
                prefixIcon: Icon(Icons.search),
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
              padding: EdgeInsets.symmetric(vertical: 20 ,horizontal: 40),
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
                        Text('تاريخ الانتهاء: ${drugs[index].expiryDate.toString()}'),
                        Text('الشركة المصنعة : ${drugs[index].company}'),

                      ],

                    ),
                    trailing:IconButton (
                      icon: Icon(Icons.mode_edit_outline_outlined),
                      onPressed: (){

                      },
                    ),
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
              String name;
              String description;
              int quantity;
              DateTime expiryDate;
              String company ;
              return AlertDialog(
                title: Text('إضافة دواء جديد '),
                content: Container(
                  width:MediaQuery.of(context).size.width * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: name_drag_Controller,
                          decoration: InputDecoration(labelText: 'الاسم '),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        TextField(
                          controller: description_drag_Controller,

                          decoration: InputDecoration(labelText: 'الوصف'),
                          onChanged: (value) {
                            description = value;
                          },
                        ),
                        TextField(
                          controller: quantity_drag_Controller,
                          decoration: InputDecoration(labelText: 'الكمية '),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            quantity = value as int;
                          },
                        ),
                        TextField(
                          controller: expiryDate_drag_Controller,
                          decoration: InputDecoration(labelText: 'تاريخ الانتهاء(YYYY-MM-DD)'),
                          keyboardType: TextInputType.datetime,
                          onChanged: (value) {
                            expiryDate = value as DateTime;
                          },
                        ),
                        TextField(
                          controller: company_drag_Controller,
                          decoration: InputDecoration(labelText: 'الشركة المصنعة'),
                          onChanged: (value) {
                            company = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('إلغاء'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('إضافة'),
                    onPressed: () {


                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
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
  String company ;

  Drug(this.name, this.description, this.quantity, this.expiryDate, this.company );
}
