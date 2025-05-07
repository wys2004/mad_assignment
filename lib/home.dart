import 'package:flutter/material.dart';
import 'Charity.dart';
import 'AboutUs.dart';
import 'payment.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Default to Home

  final List<Widget> _pages = [
    Charity(),
    HomeContent(), // Main content with images
    AboutUs(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Charity'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About Us'),
        ],
      ),
    );
  }
}

// -----------------------------
// HOME PAGE MAIN CONTENT
// -----------------------------
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(), // Your main screen with nav and images
  ));
}



class DonationItem {
  final String imagePath;
  final double goalAmount;
  double donatedAmount;

  DonationItem({
    required this.imagePath,
    required this.goalAmount,
    required this.donatedAmount,
  });

  double get progress => (donatedAmount / goalAmount).clamp(0.0, 1.0);
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<DonationItem> donations = [
    DonationItem(imagePath: 'assets/images/charity.png', goalAmount: 1000.0, donatedAmount: 0),
    DonationItem(imagePath: 'assets/images/charity1.png', goalAmount: 3000.0, donatedAmount: 0),
    DonationItem(imagePath: 'assets/images/charity2.png', goalAmount: 1500.0, donatedAmount: 0),
    DonationItem(imagePath: 'assets/images/charity4.png', goalAmount: 500.0, donatedAmount: 0),
  ];

  Future<void> _navigateToPayment(int index) async {
    final result = await Navigator.push<double>(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(
          currentAmount: donations[index].donatedAmount,
          goalAmount: donations[index].goalAmount,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        donations[index].donatedAmount = result;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scrollable content
        SingleChildScrollView(
          padding: EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 20),
          child: Column(
            children: List.generate(donations.length, (index) {
              final item = donations[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () => _navigateToPayment(index),
                    child: Image.asset(item.imagePath, height: 280, fit: BoxFit.cover),
                  ),
                  SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: item.progress,
                    minHeight: 10,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${item.donatedAmount.toStringAsFixed(2)} / ${item.goalAmount.toStringAsFixed(2)} RM donated",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 30),
                ],
              );
            }),
          ),
        ),

        // Top bar with back and profile
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            color: Colors.white.withOpacity(0.9),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile/Login button
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  }


