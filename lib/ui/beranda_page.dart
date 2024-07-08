import 'package:flutter/material.dart';
import '../widget/sidebar_page.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarPage(),
      appBar: AppBar(title: Text("Beranda")),
      body: Center(
        child: Text("Selamat Datang"),
      ),
    );
  }
}
