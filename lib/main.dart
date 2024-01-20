import 'package:flutter/material.dart';
import 'package:test_assignment_to_n_company/models/api_work.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("testovoe"),
        ),
        body: FutureBuilder(
          future: ApiClient().fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final tourData = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Название отеля: ${tourData.hotelName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                    Text('Адрес отеля: ${tourData.hotelAddress}'),
                    Text('Рейтинг отеля: ${tourData.hoRating}'),
                  ],
                ),
              );
            }
          },
        ),
      ),
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
      ),
    );
  }
}
