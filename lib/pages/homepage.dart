import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3452e5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Ahmah Fauzan",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xfffff8f8),
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: Color(0xffffffff),
          size: 24,
        ),
        actions: [
          Icon(Icons.person, color: Color(0xffffffff), size: 24),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GridView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.2,
            ),
            children: [
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff3b58eb),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "1001",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Color(0xffa9e6fb),
                      ),
                    ),
                    Text(
                      "Total Siswa",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 10,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff3c59ec),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "501",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Color(0xffa8e6fb),
                      ),
                    ),
                    Text(
                      "Laki - laki",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff3c58eb),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "500",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Color(0xffa9e7fc),
                      ),
                    ),
                    Text(
                      "Perempuan",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GridView(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            children: [
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff3f5beb),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Jenis Kelamin",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Image(
                      image: AssetImage("asset/jenkel.png"),
                      height: 100,
                      width: 140,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff3d59ea),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Kota",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Color(0xfffffefe),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Image(
                      image: AssetImage("asset/kota.png"),
                      height: 100,
                      width: 140,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: GridView(
              padding: EdgeInsets.all(16),
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              children: [
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff3d58e5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          "Tahun Kelahiran",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Image(
                          image: AssetImage("asset/tahunlahir.png"),
                          height: 132,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
