import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../ui/pegawai_detail_page.dart';

class PegawaiFormPage extends StatefulWidget {
  const PegawaiFormPage({super.key});

  @override
  State<PegawaiFormPage> createState() => _PegawaiFormPageState();
}

class _PegawaiFormPageState extends State<PegawaiFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Tambah Pegawai"),),
      body: SingleChildScrollView(
          child: Form (
            key: _formKey,
            child: Column (
              children: [
                _field(
                    namafield: "Nama Pegawai",
                    namacontroller: _namaPegawaiCtrl
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
        Pegawai pegawai= Pegawai(namaPegawai: _namaPegawaiCtrl.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => PegawaiDetailPage(pegawai: pegawai)
          ),
        );
      },
      child: Text ("Simpan"),
    );
  }
}
