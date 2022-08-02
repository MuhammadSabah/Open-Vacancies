import 'package:class_assignment_2/src/firebase/user_auth_dao.dart';
import 'package:class_assignment_2/src/models/message.dart';
import 'package:class_assignment_2/src/firebase/message_dao.dart';
import 'package:class_assignment_2/src/screens/register_screen_view.dart';
import 'package:class_assignment_2/src/widgets/bottom_message_input_field.dart';
import 'package:class_assignment_2/src/widgets/message_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpenVacanciesScreen extends StatefulWidget {
  const OpenVacanciesScreen({Key? key}) : super(key: key);

  @override
  State<OpenVacanciesScreen> createState() => _OpenVacanciesScreenState();
}

class _OpenVacanciesScreenState extends State<OpenVacanciesScreen> {
  late Stream<QuerySnapshot<Object?>> _streamResult;

  @override
  void initState() {
    super.initState();
    _streamResult = MessageDao().getMessagesStream();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: _buildMessagesAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2.3,
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
              const BottomMessageInputField(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildMessagesAppBar() {
    return AppBar(
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
