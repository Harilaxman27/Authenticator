import 'package:flutter/material.dart';
class Mybuttons extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const Mybuttons({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
        color: Colors.black,
        ),
        child:  Center(
          child: Text(text,
          style: const TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          ),
        ),
      ),
    );
  }
}
