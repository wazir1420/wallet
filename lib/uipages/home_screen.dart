import 'package:flutter/material.dart';
import 'package:walletapp/transfer_friend_pages/transfer_fund.dart';
import 'package:walletapp/uipages/more_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: screenHeight * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      ListTile(
                        leading: Image.asset(
                          'assets/images/CE 1.png',
                          width: 80,
                        ),
                        trailing: Container(
                          height: 25,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/award_star.png',
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '1,972 Points',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your Balance',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'RP 24.321.900',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TransferFund()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    'assets/images/transfer 1.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Tranfer',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/images/icon-wallet.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Top Up',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/images/icon-wtihdraw.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Withdraw',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MorePage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    'assets/images/icon-more.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'More',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Send Again',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.4,
                ),
                const Text(
                  'See all ',
                  style: TextStyle(color: Colors.green),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.green,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 20,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  customColumn(
                      Colors.white, 'assets/images/aset.webp', 'Ahmed Ali'),
                  customColumn(
                      Colors.white, 'assets/images/boy.jpeg', 'Umar Naeem'),
                  customColumn(
                      Colors.white, 'assets/images/girldp.jpg', 'Bisma Bano'),
                  customColumn(
                      Colors.white, 'assets/images/jas.webp', 'Tanveer Abbas'),
                  customColumn(
                      Colors.white, 'assets/images/myone.webp', 'Wazir Ahmed'),
                  customColumn(
                      Colors.white, 'assets/images/photo.jpeg', 'Mohsin Uni'),
                  customColumn(
                      Colors.white, 'assets/images/pro.jpeg', 'Hamza Uni'),
                  customColumn(
                      Colors.white, 'assets/images/wa.jpg', 'Tatheer Abbas'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Latest Transaction',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.25,
                ),
                const Text(
                  'See all ',
                  style: TextStyle(color: Colors.green),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.green,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            customListTile('assets/images/transfer 1.png', 'Transfer',
                'Yesterday 19:12', '-Rp 600.000', Colors.red),
            const SizedBox(
              height: 10,
            ),
            customListTile('assets/images/icon-wallet.png', 'Top Up',
                'May 29, 2023, 19:12', '+Rp 260.000', Colors.green),
            const SizedBox(
              height: 10,
            ),
            customListTile('assets/images/Group.png', 'Internet',
                'May 23, 2023, 17:34', '-Rp 350.000', Colors.red),
            const SizedBox(
              height: 10,
            ),
            customListTile('assets/images/transfer 1.png', 'Transfer',
                'Yesterday 19:12', '-Rp 600.000', Colors.red),
            const SizedBox(
              height: 10,
            ),
            customListTile('assets/images/Group.png', 'Internet',
                'May 23, 2023, 17:34', '-Rp 350.000', Colors.red),
            const SizedBox(
              height: 10,
            ),
            customListTile('assets/images/icon-wallet.png', 'Top Up',
                'May 29, 2023, 19:12', '+Rp 260.000', Colors.green),
            const SizedBox(
              height: 10,
            ),
            customListTile('assets/images/Group.png', 'Internet',
                'May 23, 2023, 17:34', '-Rp 350.000', Colors.red),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/transfer 1.png'),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/icon-report.png'),
                ),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 60,
                  width: 60,
                  child: Center(
                      child: Image.asset('assets/images/nav-menu 3.png')),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/icon-history.png'),
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/profile.png'),
                ),
                label: 'Profile',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }
}

Widget customColumn(Color color, String image, String name) {
  return Column(
    children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: color, width: 2)),
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        name,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}

Widget customListTile(
    String image, String title, String subtitle, String amount, Color color) {
  return ListTile(
    leading: Container(
        height: 50,
        width: 50,
        decoration:
            BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
        child: Image.asset(image)),
    title: Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(subtitle),
    trailing: Text(
      amount,
      style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}
