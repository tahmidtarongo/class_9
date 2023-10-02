// ignore_for_file: use_build_context_synchronously

import 'package:class_8/Screen/splash_screen.dart';
import 'package:class_8/Screen/ui_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/data_model.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    imageController.text = prefs.getString('imageLink') ?? '';
    phoneController.text = prefs.getString('phoneNumber') ?? '';
    emailController.text = prefs.getString('email') ?? '';
    nameController.text = prefs.getString('name') ?? '';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Input Screen')),
        bottomNavigationBar: GestureDetector(
          onTap: () async {
            final SharedPreferences prefs = await SharedPreferences.getInstance();

            if (formKey.currentState?.validate() ?? false) {
              await prefs.setString('imageLink', imageController.text);
              await prefs.setString('name', nameController.text);
              await prefs.setString('email', emailController.text);
              await prefs.setString('phoneNumber', phoneController.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                      // data: data,
                      ),
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Colors.teal),
              child: const Center(
                  child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: imageController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Image in required';
                      }
                      return null;
                    },
                    // onChanged: (value) {
                    //   data.imageLink = value;
                    // },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Image',
                      hintText: 'Please enter a image',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Name in required';
                      }
                      return null;
                    },
                    // onChanged: (value) {
                    //   data.name = value;
                    // },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Please enter your name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Email in required';
                      }
                      return null;
                    },
                    // onChanged: (value) {
                    //   data.email = value;
                    // },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Please enter your email address',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      return null;
                    },
                    // onChanged: (value) {
                    //   data.mobileNumber = value;
                    // },
                    // controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                      hintText: 'Please enter your phone number',
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
