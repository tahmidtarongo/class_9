import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,required this.data});

 final Data data;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              backgroundImage:NetworkImage(widget.data.imageLink),
            ),
             Text(
              widget.data.name,
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
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  widget.data.mobileNumber,
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
                  widget.data.email,
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
