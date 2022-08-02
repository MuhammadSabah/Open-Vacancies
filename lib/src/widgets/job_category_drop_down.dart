import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JobCategoryDropDown extends StatefulWidget {
  JobCategoryDropDown({
    Key? key,
    required this.categoryList,
    required this.categoryValue,
  }) : super(key: key);

  List<String> categoryList;

  String categoryValue;
  @override
  State<JobCategoryDropDown> createState() => _JobCategoryDropDownState();
}

class _JobCategoryDropDownState extends State<JobCategoryDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Job Category",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 209, 209),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      widget.categoryValue.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: DropdownButton(
                    iconEnabledColor: Colors.red.shade700,
                    iconDisabledColor: Colors.red.shade700,
                    items: widget.categoryList.map((category) {
                      return DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.toString(),
                          ));
                    }).toList(),
                    onChanged: (value) {
                      if (value is String) {
                        setState(() {
                          widget.categoryValue = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
