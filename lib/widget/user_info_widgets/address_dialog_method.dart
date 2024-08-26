import 'package:flutter/material.dart';

class AddressDialog extends StatelessWidget {
  final BuildContext context;
  const AddressDialog({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: const Text(
        'Address',
        style: TextStyle(
          color: Color(0xff4157FF),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Address',
              hintStyle: TextStyle(
                color: Colors.grey[500],
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xff4157FF),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xff4157FF),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 15.0,
              ),
            ),
            maxLines: 5,
            minLines: 3,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            autofocus: true,
            enableSuggestions: true,
            style: const TextStyle(color: Colors.black),
            cursorColor: const Color(0xff4157FF),
            scrollPadding: const EdgeInsets.all(20.0),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              // Handle save action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff4157FF),
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 20.0,
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
