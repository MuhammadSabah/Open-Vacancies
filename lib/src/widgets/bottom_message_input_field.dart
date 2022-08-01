import 'package:class_assignment_2/src/models/message.dart';
import 'package:class_assignment_2/src/firebase/message_dao.dart';
import 'package:flutter/material.dart';

class BottomMessageInputField extends StatefulWidget {
  const BottomMessageInputField({Key? key}) : super(key: key);

  @override
  State<BottomMessageInputField> createState() =>
      _BottomMessageInputFieldState();
}

class _BottomMessageInputFieldState extends State<BottomMessageInputField> {
  late TextEditingController _companyController;
  late TextEditingController _roleController;
  late TextEditingController _urlController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController(text: "");
    _companyController = TextEditingController(text: "");
    _roleController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _urlController = TextEditingController(text: "");
    _companyController = TextEditingController(text: "");
    _roleController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xffE9E9E9),
            ),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // !: COMPANY Text field
                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: 100,
                      ),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Field can\'t be empty';
                          }
                          return null;
                        },
                        controller: _companyController,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        autocorrect: false,
                        maxLines: 1,
                        cursorColor: Colors.grey.shade800,
                        decoration: InputDecoration(
                          hintText: 'COMPANY/ORG:',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: const Color(0xffF6F6F6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // !: ROLE Text field
                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: 500,
                      ),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Field can\'t be empty';
                          }
                          return null;
                        },
                        controller: _roleController,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        autocorrect: false,
                        maxLines: 1,
                        cursorColor: Colors.grey.shade800,
                        decoration: InputDecoration(
                          hintText: 'ROLE:',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: const Color(0xffF6F6F6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // !: URL Text field
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Field can\'t be empty';
                              }
                              return null;
                            },
                            controller: _urlController,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            autocorrect: false,
                            // maxLines: 1,
                            cursorColor: Colors.grey.shade800,
                            decoration: InputDecoration(
                              hintText: 'URL:',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF6F6F6),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xffE9E9E9),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xffE9E9E9),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xffE9E9E9),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: IconButton(
                            splashRadius: 28,
                            splashColor: Colors.white60,
                            onPressed: () {
                              _sendMessage();
                            },
                            icon: Icon(
                              Icons.send,
                              size: 40,
                              color: Colors.red.shade500,
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
      ),
    );
  }

  void _sendMessage() {
    final MessageDao messageDao = MessageDao();
    if (_companyController.text.isNotEmpty && _urlController.text.isNotEmpty) {
      final message = Message(
        company: _companyController.text,
        role: _roleController.text,
        date: DateTime.now(),
        url: _urlController.text,
      );
      messageDao.saveMessage(message);
      _urlController.clear();
      _companyController.clear();
      setState(() {});
    }
  }
}
