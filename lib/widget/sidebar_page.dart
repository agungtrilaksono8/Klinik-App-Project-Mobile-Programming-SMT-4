import 'package:flutter/material.dart';
import '../ui/beranda_page.dart';
import '../ui/klinik_page.dart';
import '../ui/login_page.dart';
import '../ui/pasien_detail_page.dart';
import '../ui/pasien_form_page.dart';
import '../ui/pegawai_detail_page.dart';
import '../ui/pegawai_form_page.dart';
import '../ui/poli_page.dart';

class SidebarPage extends StatelessWidget {
  const SidebarPage({Key? key}) : super(key: key);

  get pegawai => PegawaiDetailPage(pegawai: pegawai);
  get pasien => PasienDetailPage(pasien: pasien);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView (
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text ("admin@admin.com")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),

          ListTile(
            leading: Icon(Icons.accessible),
            title: Text("Poli"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoliPage()));
            },
          ),

          ListTile(
            leading: Icon(Icons.people),
            title: Text("Pegawai"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PegawaiDetailPage(pegawai: pegawai)));
            },
          ),

          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Pasien"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasienDetailPage(pasien: pasien)));
            },
          ),

          ListTile(
            leading: Icon(Icons.login_rounded),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
