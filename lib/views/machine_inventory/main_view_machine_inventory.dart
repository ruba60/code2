import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainViewMachine extends StatefulWidget {
  const MainViewMachine({super.key});

  @override
  State<MainViewMachine> createState() => _MainViewMachineState();
}

class _MainViewMachineState extends State<MainViewMachine> {

  List<Machine> machine = [
    Machine('جهاز 1 ', 'Used to treat pain and fever.', 50, DateTime(2023, 12, 31), 'سامسونج',),
    Machine('جهاز 2', 'Used to treat bacterial infections.', 30, DateTime(2024, 6, 30), 'سامسونج',),
    Machine('جهاز 3', 'Used to treat allergies.', 20, DateTime(2023, 8, 15), 'سامسونج ' ,),
  ];


  List<Machine> filteredMachine = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController name_machine_Controller = TextEditingController();
  TextEditingController description_machine_Controller = TextEditingController();
  TextEditingController quantity_machine_Controller = TextEditingController();
  TextEditingController expiryDate_machine_Controller = TextEditingController();
  TextEditingController company_machine_Controller = TextEditingController();

  @override
  void initState() {
    filteredMachine= machine;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('مستودع الأجهزة '),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [

          Container(

            padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 100 ),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                label: Text('البحث عن جهاز'),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),

              onChanged: (value) {
                setState(() {
                  filteredMachine = machine
                      .where((machine) =>
                      machine.name.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(

            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 40),
              itemCount: machine.length,
              itemBuilder: (context, index) {
                return Container(
                  color: index % 2 == 0 ? Colors.grey[100] : Colors.white,
                  child: ListTile(
                    title: Text(machine[index].name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('الوصف: ${machine[index].description}'),
                        Text('الكمية: ${machine[index].quantity}'),
                        Text('تاريخ الانتهاء: ${machine[index].expiryDate.toString()}'),
                        Text('الشركة المصنعة: ${machine[index].company}'),

                      ],

                    ),
                    trailing:IconButton (
                      icon: Icon(Icons.mode_edit_outline_outlined),
                      onPressed: (){

                      },
                    ),
                    onTap: () {

                    },

                  ),
                );

              },

            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(

         backgroundColor: Colors.grey[300] ,
        mini: false,

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
                title: Text('إضافة جهاز جديد'),
                content: Container(
                  width:MediaQuery.of(context).size.width * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: name_machine_Controller,
                          decoration: InputDecoration(labelText: 'الاسم'),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        TextField(
                          controller: description_machine_Controller,

                          decoration: InputDecoration(labelText: 'الوصف'),
                          onChanged: (value) {
                            description = value;
                          },
                        ),
                        TextField(
                          controller: quantity_machine_Controller,
                          decoration: InputDecoration(labelText: 'الكمية'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            quantity = value as int;
                          },
                        ),
                        TextField(
                          controller: expiryDate_machine_Controller,
                          decoration: InputDecoration(labelText: 'تاريخ الانتهاء (YYYY-MM-DD)'),
                          keyboardType: TextInputType.datetime,
                          onChanged: (value) {
                            expiryDate = value as DateTime;
                          },
                        ),
                        TextField(
                          controller: company_machine_Controller,
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
    );
  }
}


class Machine {
  String name;
  String description;
  int quantity;
  DateTime expiryDate;
  String company ;

  Machine(this.name, this.description, this.quantity, this.expiryDate, this.company );
}
