import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('data', style: TextStyle(fontSize: 40),));
  }
  void getHttp() async{
    final dio = Dio();

    final baseUrl = 'https://dattebayo-api.onrender.com/';
    final endPoint = 'akatsuki';
    final response = await dio.get('$baseUrl$endPoint');
    print(response.data);
  }
}
