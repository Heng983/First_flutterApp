import 'package:flutter/material.dart';
import 'food_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondScreen extends StatelessWidget {
  //const SecondScreen({super.key});

  Sildeitem item;
  SecondScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${item.title}"),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(item.image),
            SizedBox(height: 12),
            Text(
              item.title2,
              style: GoogleFonts.moul(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
