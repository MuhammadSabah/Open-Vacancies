import 'package:class_assignment_2/src/firebase/user_profile_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({
    Key? key,
    required this.company,
    required this.role,
    required this.url,
  }) : super(key: key);
  final String company;
  final String role;
  final String url;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  var userData = {};
  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    userData = snapshot.data() ?? {};
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              border: Border.all(
                color: Colors.red.shade500,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData['name'] ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.company.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.role.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final Uri link = Uri.parse(widget.url);
                          if (!await launchUrl(link,
                              mode: LaunchMode.externalApplication)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Could not be launched!'),
                              duration: const Duration(
                                milliseconds: 2300,
                              ),
                              backgroundColor: Colors.red.shade500,
                            ));
                          }
                        },
                        child: Text(
                          'Link'.toUpperCase(),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 90, 90, 90),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
