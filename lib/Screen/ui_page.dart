import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/data_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // final Data data;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Data value = Data(email: '', mobileNumber: '', imageLink: '', name: '');
  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    value.imageLink = prefs.getString('imageLink') ?? '';
    value.mobileNumber = prefs.getString('phoneNumber') ?? '';
    value.email = prefs.getString('email') ?? '';
    value.name = prefs.getString('name') ?? '';

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(value.imageLink),
            ),
            Text(
              value.name,
              style: const TextStyle(
                fontFamily: "Pacifico",
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ), //
            Text(
              "FLUTTER DEVELOPER",
              style: GoogleFonts.sourceSans3(
                color: Colors.teal.shade100,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  value.mobileNumber,
                  style: GoogleFonts.sourceSans3(
                    color: Colors.teal.shade900,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.email),
                title: Text(
                  value.email,
                  style: GoogleFonts.sourceSans3(
                    color: Colors.teal.shade900,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
