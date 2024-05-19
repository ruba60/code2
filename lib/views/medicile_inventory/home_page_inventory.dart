
import 'package:flutter/material.dart';
import 'package:ooo/views/medicile_inventory/main_view_equipment_inventory.dart';
import 'package:ooo/views/medicile_inventory/main_view_medicile_inventory.dart';


class HomePageInventory extends StatefulWidget {
  const HomePageInventory({super.key});

  @override
  State<HomePageInventory> createState() => _HomePageInventoryState();
}

class _HomePageInventoryState extends State<HomePageInventory> {

  int _selectedindex = 0 ;
  List<Widget> _widgetOptions = <Widget>[
    MainViewMedicilInventory(),
   MainViewEquipmentInventory(),
  ];


  void _onItemTapped (int index) {
    setState(() {
      _selectedindex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("مستودع الأدوية و المستلزمات الطبية "),
        backgroundColor: Colors.deepPurple,
      ),
      body: _widgetOptions.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services,color: Colors.black,),
          label: " أدوية",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build,color: Colors.black,),
          label: "مستلزمات طبية",
          ),
        ],
        currentIndex: _selectedindex,
        onTap: _onItemTapped,
        backgroundColor: Colors.deepPurple,

      ),


    );
  }
}
