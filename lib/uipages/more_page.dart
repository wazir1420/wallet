import 'package:flutter/material.dart';
import 'package:walletapp/transfer_friend_pages/transfer_fund.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: screenHeight * 0.2,
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.01),
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
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    spacing: 30,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: Container(
                          height: 10,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          const Text(
                            'Main Menu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.4,
                          ),
                          const Text(
                            'Edit Menu ',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TransferFund()));
                            },
                            child: customColumn(
                                'assets/images/transfer 1.png', 'Transfer'),
                          ),
                          customColumn(
                              'assets/images/icon-wallet.png', 'Top Up'),
                          customColumn(
                              'assets/images/icon-wtihdraw.png', 'Withdraw'),
                          customColumn('assets/images/request.png', 'Request')
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Payment List',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customColumn(
                              'assets/images/pulse.png', 'Pulse & Data'),
                          customColumn(
                              'assets/images/electricity.png', 'Electricity'),
                          customColumn(
                              'assets/images/onliceti.png', 'Online\n Ticket'),
                          customColumn(
                              'assets/images/education.png', 'Education')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customColumn(
                              'assets/images/insurance.png', 'Insurance'),
                          customColumn('assets/images/invest.png', 'Invest'),
                          customColumn('assets/images/Group.png',
                              'Internet &\n TV Cable'),
                          customColumn(
                              'assets/images/game.png', 'Games\n Voucher')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customColumn('assets/images/emoney.png', 'E-Money'),
                          customColumn('assets/images/water.png', 'Water'),
                          customColumn(
                              'assets/images/ecomerce.png', 'E-Commerce'),
                          customColumn(
                              'assets/images/streaming.png', 'Streaming')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget customColumn(String image, String name) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 50,
        width: 50,
        decoration:
            BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
        child: Image.asset(
          image,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
