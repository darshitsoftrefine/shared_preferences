import 'dart:core';
import 'package:different_preferences_types/constants/spacing.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  String name = "";
  String password = "";
  String email = "";
  bool value = false;
  int age = 0;
  List tags = [];

  @override
  void initState() {
    getEmail().then((value) {
      setState(() {
        email = value;
      });
    });
    getPassword().then((value) {
      setState(() {
        password = value;
      });
    });
    getName().then((value) {
      setState(() {
        name = value;
      });
    });
    getAge().then((value) {
      setState(() {
        age = value;
      });
    });
    getValue().then((value) {
      setState(() {
        value = value;
      });
    });
    getTags().then((value) {
      setState(() {
        tags = value;
      });
    });
    super.initState();
  }

  Future<String> getEmail() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? obtainedEmail = sharedPreferences.getString('email');
     return obtainedEmail!;
  }

  Future<String> getPassword() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? obtainedPass = sharedPreferences.getString('pass');
    return obtainedPass!;
  }
  Future<String> getName() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? obtainedName = sharedPreferences.getString('name');
    return obtainedName!;
  }
  Future<int> getAge() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? obtainedAge = sharedPreferences.getInt('age');
    return obtainedAge!;
  }
  Future<bool> getValue() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? obtainedValue = sharedPreferences.getBool('value');
    return obtainedValue!;
  }
  Future<List> getTags() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List? obtainedTags = sharedPreferences.getStringList('tags');
    return obtainedTags!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("My Dashboard", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 500,
            height: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                  Text('Name:-  $name', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                const Spacing(height: 10),
                Text('Email Id:-  $email', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                const Spacing(height: 10),
                Text('Password:-  $password', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                const Spacing(height: 10),
                Text('Age:-  $age', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                const Spacing(height: 10),
                Text('Bool Value:-  $value', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                const Spacing(height: 10),
                Text('Experience:-  $tags', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
