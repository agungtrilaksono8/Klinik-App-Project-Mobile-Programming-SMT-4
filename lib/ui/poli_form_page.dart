import 'package:flutter/material.dart';
import '../model/poli.dart';
import '../ui/poli_detail_page.dart';

class PoliFormPage extends StatefulWidget {
  const PoliFormPage({super.key});

  @override
  State<PoliFormPage> createState() => _PoliFormPageState();
}

class _PoliFormPageState extends State<PoliFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Tambah Poli"),),
      body: SingleChildScrollView(
        child: Form (
          key: _formKey,
          child: Column (
            children: [
              _field(
                  namafield: "Nama POli",
                  namacontroller: _namaPoliCtrl
              ),
              SizedBox(height: 20,),
              _tombolsimpan()
            ],
          ),
        )
      ),
    );
  }

  Widget _field({required  String namafield, required namacontroller}) {
    return TextField(
      decoration: InputDecoration(labelText: namafield),
      controller: namacontroller,
    );
  }

  Widget _tombolsimpan (){
    return ElevatedButton(
      onPressed: () {
        Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => PoliDetailPage(poli: poli)
        ),
      );
    },
    child: Text ("Simpan"),
    );
  }
}

