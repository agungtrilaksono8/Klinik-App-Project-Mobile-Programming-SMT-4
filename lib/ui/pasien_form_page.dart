import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../ui/pasien_detail_page.dart';

class PasienFormPage extends StatefulWidget {
  const PasienFormPage({super.key});

  @override
  State<PasienFormPage> createState() => _PasienFromPageState();
}

class _PasienFromPageState extends State<PasienFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaPasienCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Tambah Pasien"),),
      body: SingleChildScrollView(
          child: Form (
            key: _formKey,
            child: Column (
              children: [
                _field(
                    namafield: "Nama Pasien",
                    namacontroller: _namaPasienCtrl
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
        Pasien pasien = Pasien(namaPasien: _namaPasienCtrl.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => PasienDetailPage(pasien: pasien)
          ),
        );
      },
      child: Text ("Simpan"),
    );
  }
}

