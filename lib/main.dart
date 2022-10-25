import 'package:corona_api_app/app/ui/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'app/repositories/data_repository.dart';
import 'app/services/api_service.dart';
import 'app/services/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(apiService: APIService(API.sandbox())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF101010),
          canvasColor: const Color(0xFF222222),
        ),
        home: const Dashboard(),
      ),
    );
  }
}
