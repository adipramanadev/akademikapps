import 'package:flutter/material.dart';

class TentangApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3956e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Tentang Aplikasi",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Color(0xffffffff),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xffffffff),
          size: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image(
                image: AssetImage("asset/LogoApp1.png"),
                height: 100,
                width: 140,
                fit: BoxFit.contain,
              ),
            ),
            Align(
              alignment: Alignment(-0.0, -0.0),
              child: Text(
                "Versi 1 (1.1.0)",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff3957ef),
                ),
              ),
            ),
            Text(
              "PT Universal Big Data (UBIG)",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff3956e6),
              ),
            ),
            Text(
              " suratkita@gmail.com",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff3654ea),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Text(
                "Akademik App adalah aplikasi akademik yang mengelola data siswa dan data kota dengan visualisasi dashboard dengan menampilkan presentasi data dari data yang ada. Aplikasi ini sebagai standar TES MAGANG UBIG.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  color: Color(0xff3d5cf4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
