import 'package:class_assignment_2/src/firebase/user_auth_dao.dart';
import 'package:class_assignment_2/src/models/message.dart';
import 'package:class_assignment_2/src/firebase/message_dao.dart';
import 'package:class_assignment_2/src/screens/login_screen_view.dart';
import 'package:class_assignment_2/src/screens/register_screen_view.dart';
import 'package:class_assignment_2/src/widgets/open_vacancies_bottom_container.dart';
import 'package:class_assignment_2/src/widgets/message_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpenVacanciesScreen extends StatefulWidget {
  const OpenVacanciesScreen({Key? key, this.userName}) : super(key: key);
  final String? userName;
  @override
  State<OpenVacanciesScreen> createState() => _OpenVacanciesScreenState();
}

class _OpenVacanciesScreenState extends State<OpenVacanciesScreen> {
  late Stream<QuerySnapshot<Object?>> _streamResult;

  @override
  void initState() {
    super.initState();
    // Calling the stream method inside initState() so that the screen won't have to load every time we send a message.
    _streamResult = MessageDao().getMessagesStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: _buildOpenVacanciesAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 6,
                  right: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0).copyWith(bottom: 0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 2.1,
                        child: StreamBuilder(
                          stream: _streamResult,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data == null) {
                              return const Center(
                                child: Text('No Data!'),
                              );
                            } else if (snapshot.hasError) {
                              return const Center(
                                child: Text('Error occurred!'),
                              );
                            }
                            return ListView.separated(
                              separatorBuilder: (_, index) {
                                return const SizedBox(height: 12);
                              },
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: ((context, index) {
                                final message = Message.fromSnapshot(
                                  snapshot.data.docs[index],
                                );
                                return MessageCard(
                                  sender: message.sender,
                                  company: message.company,
                                  role: message.role,
                                  url: message.url,
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            OpenVacanciesBottomContainer(
              senderName: widget.userName ?? '',
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildOpenVacanciesAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const LoginScreenView();
          }));
        },
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {
            UserAuthDao().logOutUser();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreenView(),
                ));
          },
          icon: Icon(
            Icons.logout,
            size: 24,
            color: Colors.red.shade500,
          ),
        )
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottomOpacity: 0,
      title: Text(
        "Open Vacancies".toUpperCase(),
        style: const TextStyle(
          fontSize: 24,
          color: Color(0xff404040),
          fontWeight: FontWeight.normal,
        ),
      ),
      centerTitle: true,
    );
  }
}
