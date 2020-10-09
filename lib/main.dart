import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pc_expert_server/Pages/FirstPage.dart';
import 'package:pc_expert_server/model/MyProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) => MyProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    ),
  ));
}
