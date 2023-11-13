import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class otherpage extends StatefulWidget {
  const otherpage({Key? key}) : super(key: key);

  @override
  State<otherpage> createState() => _otherpageState();
}

class _otherpageState extends State<otherpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('this is other page'),
      ),
    );
  }
}
