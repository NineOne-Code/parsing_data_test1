import 'package:flutter/material.dart';
import 'package:parsing_data_test1/models/view_model.dart';

import 'dart:io';
import 'package:xml/xml.dart';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ParsingDataModel model = ParsingDataModel();
  // final file = new File(SvgPicture.asset('images/kavling_2.svg'));
  @override
  Widget build(BuildContext context) {
    model.handleParsing();
    // final document = XmlDocument.parse(file.readAsStringSync());
    // inspect(document);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Container(
        padding: EdgeInsets.all(50),
        color: Colors.white,
        child: Container(
          color: Colors.red,
        ),
        // child: SvgPicture.asset('images/kavling_2.svg'),
      ),
    );
  }
}
