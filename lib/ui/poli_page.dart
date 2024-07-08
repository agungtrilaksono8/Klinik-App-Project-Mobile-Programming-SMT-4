import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/poli.dart';
import '../ui/poli_form_page.dart';
import '../ui/poli_item_page.dart';
import '../widget/sidebar_page.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarPage(),
      appBar: AppBar (
        title: const Text("Data Poli"),
        backgroundColor: Colors.amberAccent,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliFormPage()));
            },

            child: Padding (
              padding: EdgeInsets.all(10),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),

      body: ListView(
        children: [
          PoliItemPage(poli: Poli(namaPoli: "Poli Anak")),
          PoliItemPage(poli: Poli(namaPoli: "Poli Kandungan")),
          PoliItemPage(poli: Poli(namaPoli: "Poli Gigi")),
          PoliItemPage(poli: Poli(namaPoli: "Poli THT")),
        ],
      ),
    );
  }
}
