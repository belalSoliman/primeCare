import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';

class AddressDialog extends StatefulWidget {
  final BuildContext context;
  const AddressDialog({
    super.key,
    required this.context,
  });

  @override
  State<AddressDialog> createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  TextEditingController addressController = TextEditingController();
  String? address;
  final User? currentUser = authinstance.currentUser;

  @override
  void initState() {
    super.initState();
    userGet();
  }

  Future<void> userGet() async {
    if (currentUser != null) {
      try {
        String uid = currentUser!.uid;
        final DocumentSnapshot doc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();

        setState(() {
          address = doc.get('address');
          addressController.text = address ?? '';
        });
      } on FirebaseException catch (e) {
        print('Error fetching user data: $e');
        // Optionally, show an error message to the user or handle the error
      }
    } else {
      print('No user is signed in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Text(
        '$address',
        style: const TextStyle(
          color: Color(0xff4157FF),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: addressController,
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
            onPressed: () async {
              try {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(currentUser!.uid)
                    .update({"address": addressController.text});
                Navigator.pop(context);
              } catch (e) {
                Fluttertoast.showToast(
                    msg: "Something went wrong please try again",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
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
