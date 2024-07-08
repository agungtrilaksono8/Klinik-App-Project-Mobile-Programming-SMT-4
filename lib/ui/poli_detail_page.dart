import 'package:flutter/material.dart';
import '../ui/poli_page.dart';
import '../model/poli.dart';
import 'poli_update_form_page.dart';

class PoliDetailPage extends StatefulWidget {
  final Poli poli;
  const PoliDetailPage({super.key, required this.poli});

  @override
  State<PoliDetailPage> createState() => _PoliDetailPageState();
}

class _PoliDetailPageState extends State<PoliDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Poli"),),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Poli: ${widget.poli.namaPoli}",
            style: TextStyle(fontSize: 20),),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          )

        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PoliUpdateForm(poli: widget.poli)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Ubah"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini"),
            actions: [
              // tombol ya
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PoliPage()));
                  },
                  child: const Text("Ya"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              // tombol batal
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Tidak"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus"));
  }
}
