import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth authinstance = FirebaseAuth.instance;
final User? currentUser = authinstance.currentUser;
final uid = currentUser!.uid;
