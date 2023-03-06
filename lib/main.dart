import 'package:flutter/material.dart';
import 'package:lib_management/views/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
      title: 'REC Library',
    ),
  );
}
