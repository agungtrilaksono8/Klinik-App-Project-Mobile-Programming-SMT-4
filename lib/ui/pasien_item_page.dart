import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../ui/pasien_detail_page.dart';

class PasienItemPage extends StatelessWidget {
  final Pasien pasien;
  PasienItemPage ({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card (
        child: ListTile (
          title: Text ("${pasien.namaPasien}"),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PasienDetailPage(pasien: pasien))
        );
      },
    );
  }
}
