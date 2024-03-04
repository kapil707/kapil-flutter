import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:kapil11/new_api.dart';
import 'package:kapil11/user.dart';
import 'package:kapil11/utility/api_service.dart';

class Mytestclass extends StatefulWidget {
  const Mytestclass({super.key});

  @override
  State<Mytestclass> createState() => _MytestclassState();
}

class _MytestclassState extends State<Mytestclass> {

  final MyApiService myApiService = MyApiService(Dio());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Retrofit Example'),
        ),
        body: Center(
          child: FutureBuilder<UserResponse>(
            future: myApiService.get_login_api("xx","v153","123456789",""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final userItem = snapshot.data!.items.first;
                return Text('Status Message: ${userItem.user_session}');
              }
            },
          ),
        ),
      ),
    );
  }
}