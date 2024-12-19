import 'package:flutter/material.dart';
import 'package:walletapp/bank_transfer_pages/tranfer_number.dart';

class MyBank extends StatefulWidget {
  const MyBank({super.key});

  @override
  State<MyBank> createState() => _TransferFundState();
}

class _TransferFundState extends State<MyBank> {
  final List bank = [
    BankContact(
      name: 'Bank Central Asia (BCA)',
      imagePath: 'assets/images/BCA.png',
    ),
    BankContact(
      name: 'Bank Negara Indonesia (BNI)',
      imagePath: 'assets/images/BNI.png',
    ),
    BankContact(
      name: 'Bank Rakyat Indonesia (BRI)',
      imagePath: 'assets/images/bankbri.png',
    ),
    BankContact(
      name: 'Bank Tabungan Negara (BTN)',
      imagePath: 'assets/images/BTN.png',
    ),
    BankContact(
      name: 'Bank Mandiri',
      imagePath: 'assets/images/mandiri.png',
    ),
    BankContact(
      name: 'Bank Artha Graha International',
      imagePath: 'assets/images/AGI.png',
    ),
    BankContact(
      name: 'Bank CIMB Niaga',
      imagePath: 'assets/images/CIMB.png',
    ),
    BankContact(
      name: 'Bank Danamon Indonesia',
      imagePath: 'assets/images/Danamon.png',
    ),
    BankContact(
      name: 'Bank Maybank Indonesia',
      imagePath: 'assets/images/Maybank.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Transfer to Bank',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.help,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Select Bank',
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey[600],
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade400, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade400, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade400, width: 1.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        SizedBox(width: 20),
                        Text(
                          'All Banks',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ...bank.map((contact) {
                      return customListTile(
                        contact.imagePath,
                        contact.name,
                        () => _showBankDialog(contact),
                      );
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customListTile(
    String image,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            image,
            width: 40,
            height: 30,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 17,
      ),
      onTap: onTap,
    );
  }

  void _showBankDialog(BankContact bankContact) {
    final TextEditingController accountNumberController =
        TextEditingController();
    String fullAccountNumber = '';
    bool isHidden = true;
    double screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            String getMaskedNumber(String number) {
              if (number.length > 5) {
                return '*' * (number.length - 5) +
                    number.substring(number.length - 5);
              }
              return number;
            }

            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('Destination Bank')
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(bankContact.imagePath,
                            width: 30, height: 30),
                        const SizedBox(width: 8),
                        Text(
                          bankContact.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('Destination Account Number')
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: accountNumberController,
                        obscureText: false,
                        onChanged: (value) {
                          fullAccountNumber = value.replaceAll('*', '');
                          if (!isHidden) {
                            accountNumberController.text =
                                getMaskedNumber(fullAccountNumber);
                            accountNumberController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: accountNumberController.text.length),
                            );
                          }
                        },
                        decoration: InputDecoration(
                          hintText: '***** **** *****',
                          border: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isHidden = !isHidden;
                                accountNumberController.text = isHidden
                                    ? fullAccountNumber
                                    : getMaskedNumber(fullAccountNumber);
                                accountNumberController.selection =
                                    TextSelection.fromPosition(
                                  TextPosition(
                                      offset:
                                          accountNumberController.text.length),
                                );
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      )),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        if (fullAccountNumber.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BankDetailsScreen(
                                bankContact: bankContact,
                                accountNumber: fullAccountNumber,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter an account number'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple,
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        side: BorderSide(color: Colors.white, width: 2),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class BankContact {
  final String name;
  final String imagePath;

  BankContact({
    required this.name,
    required this.imagePath,
  });
}
