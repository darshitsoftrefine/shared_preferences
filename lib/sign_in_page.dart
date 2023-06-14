import 'package:different_preferences_types/constants/spacing.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'constants/custom_field.dart';
import 'constants/custom_num_field.dart';
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age = TextEditingController();
  late bool value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/179/179330.png'),
          ),
          title: const Text("LinkedIn", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 30),),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                  const Text("Stay Updated on your Professional World"),
                 const Spacing(height: 15,),
                  CustomField(label: 'Name', control: name, obs: false),
                  const Spacing(height: 20,),
                  CustomField(label: 'Email Id',
                    control: email,
                    obs: false,
                  ),
                const Spacing(height: 20,),
                  CustomField(label: 'Password',
                    control: password,
                    obs: true,),
                  const Spacing(height: 15,),
                  CustomField(label: 'Age', control: age, obs: false),
                  const Spacing(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("Forgot Password ?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const Spacing(height: 30,),
                  ElevatedButton(onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', email.text);
                    prefs.setString('pass', password.text);
                    prefs.setString('name', name.text);
                    prefs.setInt('age', 22);
                    prefs.setBool('value', true);
                    prefs.setStringList('tags', ['Professional', 'Student', 'Senior', 'Fresher']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
