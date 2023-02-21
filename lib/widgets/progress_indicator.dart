
import 'package:flutter/material.dart';

class ProgressWD extends StatelessWidget {
  const ProgressWD({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: SizedBox(
      height: 20,
      width: 20,

      child: CircularProgressIndicator(
        backgroundColor:Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ));
  }
}