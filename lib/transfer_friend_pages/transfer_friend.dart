import 'package:flutter/material.dart';
import 'package:walletapp/transfer_friend_pages/contact_detail.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferFundState();
}

class _TransferFundState extends State<Transfer> {
  final List<Contact> contacts = [
    Contact(
      name: 'Alexandria',
      phoneNumber: '+934256754786',
      imagePath: 'assets/images/wa.jpg',
    ),
    Contact(
      name: 'Bisma Bano',
      phoneNumber: '+923456756908',
      imagePath: 'assets/images/girldp.jpg',
    ),
    Contact(
      name: 'Hamza Naeem',
      phoneNumber: '+923489939786',
      imagePath: 'assets/images/jas.webp',
    ),
    Contact(
      name: 'Tanveer Abbas',
      phoneNumber: '+923009878654',
      imagePath: 'assets/images/myone.webp',
    ),
    Contact(
      name: 'Wazir Tatheer',
      phoneNumber: '+92345674900',
      imagePath: 'assets/images/photo.jpeg',
    ),
    Contact(
      name: 'Mohsin Uni',
      phoneNumber: '+923014356549',
      imagePath: 'assets/images/pro.jpeg',
    ),
    Contact(
      name: 'Wazir Tatheer Abbas',
      phoneNumber: '+923014356549',
      imagePath: 'assets/images/myone.webp',
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
                  'Transfer to Friends',
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
                                hintText: 'Search Phone Number',
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
                          const SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.purple,
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
                          'All contacts',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ...contacts.map((contact) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactDetailsScreen(
                                contact: contact,
                              ),
                            ),
                          );
                        },
                        child: customListTile(
                          contact.imagePath,
                          contact.name,
                          contact.phoneNumber,
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
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
    String subtitle,
  ) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 30,
        backgroundImage: AssetImage(image),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;
  final String imagePath;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.imagePath,
  });
}
