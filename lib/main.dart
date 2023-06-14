import 'package:different_preferences_types/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? const SignInPage() : const HomePage(),));
}