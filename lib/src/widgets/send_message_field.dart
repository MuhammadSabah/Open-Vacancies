import 'package:flutter/material.dart';

InputBorder inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: Color(0xffE9E9E9),
    width: 1,
  ),
);

class SendMessageField extends StatefulWidget {
  const SendMessageField({
    Key? key,
    this.companyController,
    required this.roleController,
    required this.urlController,
    required this.sendMessage,
  }) : super(key: key);
  final companyController;
  final roleController;
  final urlController;
  final Function() sendMessage;
  @override
  State<SendMessageField> createState() => _SendMessageFieldState();
}

class _SendMessageFieldState extends State<SendMessageField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // !: COMPANY Text field
        Container(
          constraints: const BoxConstraints(
            maxHeight: 100,
          ),
          child: _buildFormField(
            controller: widget.companyController,
            hintText: 'COMPANY/ORG:',
          ),
        ),
        const SizedBox(height: 10),
        // !: ROLE Text field
        Container(
          constraints: const BoxConstraints(
            maxHeight: 100,
          ),
          child: _buildFormField(
            controller: widget.roleController,
            hintText: 'ROLE:',
          ),
        ),
        const SizedBox(height: 10),
        // !: URL Text field
        Row(
          children: [
            Expanded(
              child: _buildFormField(
                controller: widget.urlController,
                hintText: 'URL:',
              ),
            ),
            Center(
              child: IconButton(
                splashRadius: 28,
                splashColor: Colors.white60,
                onPressed: widget.sendMessage,
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
    );
  }

  TextFormField _buildFormField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      autofocus: false,
      autocorrect: false,
      maxLines: 1,
      cursorColor: Colors.grey.shade800,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        filled: true,
        fillColor: const Color(0xffF6F6F6),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
      ),
    );
  }
}
