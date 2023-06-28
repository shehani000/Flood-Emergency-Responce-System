import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'fristpage.dart';
import 'launch_screen.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home: const LaunchScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/firstpage': (context) => const FirstPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isTablet = mediaQuery.size.width >= 600;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/logo.png", width: 80),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: isTablet ? 0.4 : 0.9,
                    child: Image.asset(
                      'assets/water.png',
                      height: constraints.maxHeight * (isTablet ? 0.4 : 0.6),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 60 : 30,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 150.0,
                          maxWidth: isTablet ? 400.0 : 1000.0,
                        ),
                        child: RoundedLoadingButton(
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                            });

                            _btnController.start();

                            Timer(const Duration(milliseconds: 100), () {
                              Navigator.pushNamed(context, '/firstpage')
                                  .then((_) {
                                setState(() {
                                  _isLoading = false;
                                  _btnController.reset();
                                });
                              });
                            });
                          },
                          controller: _btnController,
                          color: const Color(0xff006aff),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
