import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'LoginView.dart';

class LoadingView extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<LoadingView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6)).then((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.orange,
          size: 70,
        ),
      ),
    );
  }
}