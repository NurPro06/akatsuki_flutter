import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login_screen.dart';
import 'model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AkatsukiInfoAdapter());
  await Hive.openBox<AkatsukiInfo>('akatsukiBox');
  runApp(const MaterialApp(home: LoginScreen()));
}