import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  bool showStatus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        children: [
          ToggleButtons(
            children: [Text("Status"), Text("Reward")],
            isSelected: [showStatus, !showStatus],
            onPressed: (index) {
              setState(() {
                showStatus = index == 0;
              });
            },
          ),
          Expanded(child: showStatus ? buildStatus() : buildReward()),
        ],
      ),
      bottomNavigationBar: TextButton(onPressed: () => Navigator.pop(context), child: Text("Back To Home")),
    );
  }

  Widget buildStatus() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text("Welcome, [Donor Name]"),
        Card(
          child: ListTile(
            title: Text("Donated: RM 50"),
            subtitle: Text("Status: Successful"),
            trailing: ElevatedButton(onPressed: () {}, child: Text("Donate Again")),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Donated: RM 100"),
            subtitle: Text("Status: Pending"),
            trailing: ElevatedButton(onPressed: () {}, child: Text("Donate Again")),
          ),
        ),
      ],
    );
  }

  Widget buildReward() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text("🎉 Thank You for Your Support!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ListTile(
          title: Text("Donor Levels:"),
          subtitle: Text("Bronze, Silver, Gold"),
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Badges:"),
          subtitle: Text("First-Time Donor, Recurring Donor, Silver Donor, Gold Donor"),
        ),
        ListTile(
          leading: Icon(Icons.local_offer),
          title: Text("Discounts:"),
          subtitle: Text("Donate 50+ and get 10% off at StarBuck"),
        ),
        ListTile(
          leading: Icon(Icons.card_giftcard),
          title: Text("Gifts:"),
          subtitle: Text("T-shirts, tote bags, handwritten letters"),
        ),
      ],
    );
  }
}
