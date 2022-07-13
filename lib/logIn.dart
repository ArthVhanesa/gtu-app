import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(25, 60, 25, 60),
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Howdy 👋",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
              ),
              Center(
                child: Image.asset('assets/image/rocket.png', height: 240),
              ),
              const Text(
                "LogIN",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/rocket.png',
                      height: 50,
                      width: 50,
                    ),
                    const Text("Continue with google")
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 100,
              // ),
              Center(
                child: const Text(
                  "Welcome to MyGTU",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
