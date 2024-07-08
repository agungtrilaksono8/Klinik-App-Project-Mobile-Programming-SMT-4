import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../ui/klinik_page.dart';
import '../ui/pegawai_update_form_page.dart';


class PegawaiDetailPage extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiDetailPage({super.key, required this.pegawai});

  @override
  State<PegawaiDetailPage> createState() => _PegawaiDetailPageState();
}

class _PegawaiDetailPageState extends State<PegawaiDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pegawai"),),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Pegawai: ${widget.pegawai.namaPegawai}",
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
                  builder: (context) => PegawaiUpdateForm(pegawai: widget.pegawai))
          );
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
                      MaterialPageRoute(builder: (context) => KlinikPage()));
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