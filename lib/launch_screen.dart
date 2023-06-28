import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LaunchScreenState createState() => _LaunchScreenState();
}

// ignore: unused_element
class _LaunchScreen extends StatefulWidget {
  const _LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    // Delay the transition to the home screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double containerSize = constraints.maxWidth * 0.5;
            final double spinnerSize = containerSize * 0.3;

            // Responsive adjustments for container and spinner sizes
            final double responsiveContainerSize =
                containerSize >= 300 ? containerSize : 300;
            final double responsiveSpinnerSize =
                spinnerSize >= 50 ? spinnerSize : 50;

            return SizedBox(
              width: responsiveContainerSize,
              height: responsiveContainerSize,
              child: SpinKitFadingGrid(
                color: Colors.blue,
                size: responsiveSpinnerSize,
              ),
            );
          },
        ),
      ),
    );
  }
}
