import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kis_app/NetworkConnectivity.dart';
import 'package:kis_app/main.dart';
import 'package:kis_app/nav_pages/check_connectivity.dart';
import 'package:kis_app/nav_pages/main_page.dart';
import 'package:kis_app/variables.dart';
import 'package:kis_app/welcome_page.dart';

class no_internet extends StatefulWidget {
  const no_internet({super.key});

  @override
  State<no_internet> createState() => _no_internetState();
}

class _no_internetState extends State<no_internet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('មិនដំណើរការ',
                  style: TextStyle(fontSize: 20, color: Colors.red)),
            ),
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckConnectivity()));
                    return;
                  },
                  icon: Icon(Icons.refresh)),
            )
          ]),
    );
  }
}
