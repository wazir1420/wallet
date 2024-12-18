import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:walletapp/transfer_friend_pages/transaction_sucess.dart';
import 'package:walletapp/transfer_friend_pages/transfer_friend.dart';

class ContactDetailsScreen extends StatefulWidget {
  final Contact contact;

  const ContactDetailsScreen({super.key, required this.contact});

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    amountController.addListener(checkButtonState);
  }

  @override
  void dispose() {
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void checkButtonState() {
    setState(() {
      isButtonEnabled = amountController.text.isNotEmpty &&
          double.tryParse(
                  amountController.text.replaceAll(RegExp('[^0-9]'), '')) !=
              null &&
          double.parse(amountController.text.replaceAll(RegExp('[^0-9]'), '')) >
              0;
    });
  }

  void updateAmountWithPrefix(String value) {
    String newValue = value.replaceAll(RegExp('[^0-9]'), '');
    if (newValue.isNotEmpty) {
      newValue = 'Rp $newValue';
    }
    amountController.value = TextEditingValue(
      text: newValue,
      selection: TextSelection.collapsed(offset: newValue.length),
    );
  }

  String generateReferenceNumber() {
    final random = DateTime.now().millisecondsSinceEpoch.toString();
    return 'REF${random.substring(random.length - 10)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const Spacer(),
                const Text(
                  'Transfer to Friends',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(Icons.help, color: Colors.white),
              ],
            ),
          ),
          Container(
            color: Colors.purple,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Your Balance",
                        style: TextStyle(color: Colors.white70, fontSize: 16)),
                    SizedBox(height: 5),
                    Text("Rp 24.321.900",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset('assets/images/icon-wallet.png',
                      height: 20, width: 20),
                  label: const Text("Top Up"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.purple),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage(widget.contact.imagePath)),
                              title: Text(widget.contact.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(widget.contact.phoneNumber),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            const Text("Set Amount",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 200,
                              child: TextField(
                                controller: amountController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: updateAmountWithPrefix,
                                decoration: InputDecoration(
                                  hintText: "Rp 0",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  hintStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text("Notes",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          Text(" (Optional)",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: notesController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Write your notes here",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        double amount = double.parse(amountController.text
                            .replaceAll(RegExp('[^0-9]'), ''));
                        double fee = amount * 0.02;
                        double totalAmount = amount + fee;
                        String referenceNumber = generateReferenceNumber();
                        String transactionDate =
                            DateFormat('dd MMM yyyy, hh:mm a')
                                .format(DateTime.now());

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionSuccessScreen(
                              amount: amount,
                              referenceNumber: referenceNumber,
                              fee: fee,
                              total: totalAmount,
                              date: transactionDate,
                              contact: widget.contact,
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isButtonEnabled ? Colors.purple : Colors.grey[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Proceed to Transfer",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
