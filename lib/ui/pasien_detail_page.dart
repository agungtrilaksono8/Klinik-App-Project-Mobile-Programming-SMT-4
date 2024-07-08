import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../ui/klinik_page.dart';
import '../ui/pasien_update_form_page.dart';
import '../widget/sidebar_page.dart';

class PasienDetailPage extends StatefulWidget {
  final Pasien pasien;
  const PasienDetailPage({super.key, required this.pasien});

  @override
  State<PasienDetailPage> createState() => _PasienDetailPageState();
}

class _PasienDetailPageState extends State<PasienDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarPage(),
      appBar: AppBar(
        title: Text("Detail Pasien"),),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Pasien: ${widget.pasien.namaPasien}",
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
                  builder: (context) => PasienUpdateForm(pasien: widget.pasien))
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
