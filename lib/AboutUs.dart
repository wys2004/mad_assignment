import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Welcome to CharitYou, the charity donation platform built to connect kind-hearted donors with those in need. Our mission is to make giving simple, transparent, and impactful.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Why Choose Us? 🌍 Support Meaningful Causes – Easily discover verified charities and urgent campaigns.  📊 Track Your Impact – View your donation history and see how funds are used.  🔒 Secure & Transparent – Every transaction is recorded and traceable.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15 ),
            Text("Why Choose Us?", style: TextStyle(fontSize: 18)),
            ListTile(leading: Icon(Icons.favorite), title: Text("Support meaningful causes", style: TextStyle(fontSize: 18))),
            ListTile(leading: Icon(Icons.track_changes), title: Text("Track your impact", style: TextStyle(fontSize: 18))),
            ListTile(leading: Icon(Icons.lock), title: Text("Secure & Transparent", style: TextStyle(fontSize: 18))),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle camera image tap
                  },
                  child: Image.asset(
                    ' assets/images/instagram.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle Facebook image tap
                  },
                  child: Image.asset(' assets/images/facebook.png', width: 40, height: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle Telegram image tap
                  },
                  child: Image.asset(
                    ' assets/images/x.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
