import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../ui/pegawai_detail_page.dart';


class PegawaiItemPage extends StatelessWidget {
  final Pegawai pegawai;
  PegawaiItemPage ({super.key, required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card (
        child: ListTile (
          title: Text ("${pegawai.namaPegawai}"),
        ),
      ),
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PegawaiDetailPage(pegawai: pegawai))
        );
      },
    );
  }
}
