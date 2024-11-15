import 'package:flutter/material.dart';
import 'package:monitoring_karyawan_wfh/presentation/pages/absensi_page.dart'; // Pastikan impor ini benar

class NavigateToPage {
  // Fungsi untuk navigasi ke halaman Absensi
  static Future<void> toAbsensiPage(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AbsensiPage(),
      ),
    );
  }
}
