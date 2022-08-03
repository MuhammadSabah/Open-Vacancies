import 'package:class_assignment_2/src/models/message.dart';
import 'package:class_assignment_2/src/firebase/message_dao.dart';
import 'package:class_assignment_2/src/widgets/send_message_field.dart';
import 'package:flutter/material.dart';

class OpenVacanciesBottomContainer extends StatefulWidget {
  const OpenVacanciesBottomContainer({Key? key}) : super(key: key);

  @override
  State<OpenVacanciesBottomContainer> createState() =>
      _OpenVacanciesBottomContainerState();
}

class _OpenVacanciesBottomContainerState
    extends State<OpenVacanciesBottomContainer> {
  late TextEditingController _companyController;
  late TextEditingController _roleController;
  late TextEditingController _urlController;

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
    _urlController.dispose();
    _companyController.dispose();
    _roleController.dispose();
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
              child: SendMessageField(
                companyController: _companyController,
                roleController: _roleController,
                urlController: _urlController,
                sendMessage: _sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    final MessageDao messageDao = MessageDao();
    if (_companyController.text.isNotEmpty &&
        _urlController.text.isNotEmpty &&
        _roleController.text.isNotEmpty) {
      final message = Message(
        company: _companyController.text,
        role: _roleController.text,
        date: DateTime.now(),
        url: _urlController.text,
      );
      messageDao.saveMessage(message);
      _companyController.clear();
      _roleController.clear();
      _urlController.clear();
      setState(() {});
    }
  }
}
