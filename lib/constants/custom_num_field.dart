import 'package:flutter/material.dart';

class CustomNumField extends StatelessWidget {
  const CustomNumField({super.key, required this.label, required this.control, required this.obs});
  final String label;
  final TextEditingController control;
  final bool obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: control,
        obscureText: obs,
        decoration: InputDecoration(
            labelText: label,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                )
            )
        ),
      ),
    );
  }
}
