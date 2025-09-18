import 'package:flutter/material.dart';
import 'package:prime_diversition/presentations/home/providers/home_page_provider.dart';
import 'package:prime_diversition/presentations/landing/pages/landing_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'NotoSans',
        ),
        home: const LandingPage(),
      ),
    );
  }
}
