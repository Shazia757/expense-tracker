import 'package:expense_management_app/edit_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Good afternoon,',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Total Balance Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(67, 136, 131, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  '₹25,000.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_downward_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '₹30,000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(width: 1, height: 42, color: Colors.white38),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_upward_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expenses',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '₹5,000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Daily Average and Weekly Boxes
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color.fromRGBO(67, 136, 131, 0.5),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.today_outlined,
                        color: Color.fromRGBO(67, 136, 131, 1),
                        size: 24,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'DAILY AVERAGE',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '₹500',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(67, 136, 131, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color.fromRGBO(67, 136, 131, 0.5),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_view_week_outlined,
                        color: Color.fromRGBO(67, 136, 131, 1),
                        size: 24,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'WEEKLY',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '₹3,500',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(67, 136, 131, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // Transaction History Heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transactions History',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(color: Color.fromRGBO(67, 136, 131, 1)),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF438883),
        foregroundColor: Colors.white,
        onPressed: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => AddScreen())),
        child: Icon(Icons.add),
      ),
    );
  }
}
