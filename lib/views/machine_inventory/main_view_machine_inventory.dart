
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
        title: const Text('مستودع الأجهزة '),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [

          Container(

            padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 100 ),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                label: const Text('البحث عن جهاز'),
                prefixIcon: const Icon(Icons.search),
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
              padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 40),
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
                      icon: const Icon(Icons.mode_edit_outline_outlined),
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
              // String name;
              // String description;
              // int quantity;
              // DateTime expiryDate;
              // String company ;
              return AlertDialog(
                title: const Text('إضافة جهاز جديد'),
                content: SizedBox(
                  width:MediaQuery.of(context).size.width * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: name_machine_Controller,
                          decoration: const InputDecoration(labelText: 'الاسم'),
                          onChanged: (value) {
                       //     var name = value;
                          },
                        ),
                        TextField(
                          controller: description_machine_Controller,

                          decoration: const InputDecoration(labelText: 'الوصف'),
                          onChanged: (value) {
                        //    var description = value;
                          },
                        ),
                        TextField(
                          controller: quantity_machine_Controller,
                          decoration:const InputDecoration(labelText: 'الكمية'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                         //   var quantity = value as int;
                          },
                        ),
                        TextField(
                          controller: expiryDate_machine_Controller,
                          decoration: const InputDecoration(labelText: 'تاريخ الانتهاء (YYYY-MM-DD)'),
                          keyboardType: TextInputType.datetime,
                          onChanged: (value) {
                          //  var expiryDate = value as DateTime;
                          },
                        ),
                        TextField(
                          controller: company_machine_Controller,
                          decoration: const InputDecoration(labelText: 'الشركة المصنعة'),
                          onChanged: (value) {
                         //   var company = value;
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
                        machine.add(Machine(
                          name_machine_Controller.text,
                          description_machine_Controller.text,
                          int.parse(quantity_machine_Controller.toString()),
                          DateTime.parse(expiryDate_machine_Controller.text),
                          company_machine_Controller.text,
                        ));
                        filteredMachine = machine;
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
