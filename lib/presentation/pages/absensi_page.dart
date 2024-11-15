import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AbsensiPage extends StatefulWidget {
  @override
  _AbsensiPageState createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  // Informasi karyawan
  String name = 'Olantianus Bebi Maxrin';
  String position = 'Software Engineer';
  String employeeId = 'EMP12345';
  String email = 'olanmax99@gmail.com';
  String phone = '+62 812-4606-6741';

  DateTime? checkInTime;
  DateTime? checkOutTime;
  Duration? workDuration;

  // Fungsi format waktu
  String formatDateTime(DateTime dateTime) {
    return DateFormat('EEEE, HH:mm, dd-MM-yyyy').format(dateTime);
  }

  // Fungsi untuk Check-in
  void checkIn() {
    setState(() {
      checkInTime = DateTime.now();
      checkOutTime = null;
      workDuration = null;
    });
  }

  // Fungsi untuk Check-out
  void checkOut() {
    if (checkInTime != null) {
      setState(() {
        checkOutTime = DateTime.now();
        workDuration = checkOutTime!.difference(checkInTime!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlue.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              children: [
                // Profil Karyawan dalam bentuk ID Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Foto Profil
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/profile.jpg'), // Ganti dengan path gambar Anda
                        ),
                        SizedBox(width: 16),
                        // Informasi Profil
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                              ),
                              Text(
                                position,
                                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                              ),
                              SizedBox(height: 8),
                              Text("ID: $employeeId", style: TextStyle(fontSize: 14, color: Colors.black54)),
                              Text("Email: $email", style: TextStyle(fontSize: 14, color: Colors.black54)),
                              Text("Phone: $phone", style: TextStyle(fontSize: 14, color: Colors.black54)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Informasi Check-in dan Check-out
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (checkInTime != null) ...[
                          Text(
                            "Check-in: ${formatDateTime(checkInTime!)}",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ] else ...[
                          Text("Belum Check-in.", style: TextStyle(fontSize: 16, color: Colors.black54)),
                        ],
                        if (checkOutTime != null) ...[
                          Text(
                            "Check-out: ${formatDateTime(checkOutTime!)}",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Text(
                            "Durasi Kerja: ${workDuration?.inHours} jam ${workDuration?.inMinutes.remainder(60)} menit",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ] else if (checkInTime != null) ...[
                          Text("Belum Check-out.", style: TextStyle(fontSize: 16, color: Colors.black54)),
                        ],
                      ],
                    ),
                  ),
                ),
                Spacer(),
                // Tombol Check-in dan Check-out
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: checkIn,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        "Check-in",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: checkOut,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                      child: Text(
                        "Check-out",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
