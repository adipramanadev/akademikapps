import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'siswapage.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalSiswa = 0;
  String? username;
  Future<String?> _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');
    if (savedUsername != null && savedPassword != null) {
      return savedUsername;
    }
    return prefs.getString('username');
  }

  Future<void> loginUser(String username, String tokenJwt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('tokenJwt', tokenJwt);
  }

  Future<int> fetchTotalSiswa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenJwt') ?? '';

    try {
      final response = await http.get(
        Uri.parse(
            'https://kptkgowa.adipramanacomputer.com/dashboardapi/countsiswa'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Cookie': token,
        },
      );

      if (response.statusCode == 200) {
        int totalSiswa = int.parse(response.body);
        return totalSiswa;
      } else {
        // Tangani kesalahan jika respons tidak berhasil.
        throw Exception('Gagal mengambil data total siswa');
      }
    } catch (e) {
      if (e
          .toString()
          .contains("Connection closed before full header was received")) {
        // Handle the specific error condition here
        // You can add custom handling logic for this case
        Get.snackbar(
            "Error", "Connection closed before full header was received");
      }
      return 0;
    }
  }

  void initializeData() async {
    int fetchedTotalSiswa = await fetchTotalSiswa();
    String? fetchedUsername = await _getUsername();

    setState(() {
      totalSiswa = fetchedTotalSiswa;
      username = fetchedUsername ?? 'User'; // Set a default name if null
    });
  }

  @override
  void initState() {
    super.initState();
    // getSiswa(); // Call getSiswa when the widget
    fetchTotalSiswa().then((value) {
      setState(() {
        totalSiswa = value;
      });
      _getUsername().then((value) {
        setState(() {
          username = value;
        });
      });
    });
  }

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
          username != null ? "Selamat Datang, $username" : "Selamat Datang",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xfffff8f8),
          ),
        ),
        leading: Builder(
          // Using Builder to get the correct context
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Color(0xffffffff)),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: [
          Icon(Icons.person, color: Color(0xffffffff), size: 24),
        ],
      ),
      // Bagian drawer, body, dan bottomNavigationBar tetap sama
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff3A57E8),
              ),
              accountName: Text(username ?? "Your Name Here"),
              accountEmail: Text("test@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Halaman Siswa"),
              onTap: () {
                // Navigasi ke halaman siswa atau fungsi lain
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Siswa(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                // Navigasi ke halaman settings atau fungsi lain
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Log Out"),
              onTap: () {
                // Fungsi untuk log out
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GridView(
            padding: const EdgeInsets.all(16),
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
                      //menampilkan data countsiswa
                      totalSiswa.toString(),
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
