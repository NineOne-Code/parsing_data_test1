import 'dart:developer';
import 'dart:convert';
import 'package:parsing_data_test1/models/model.dart';
import 'package:xml2json/xml2json.dart';

import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'dart:io';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

final bookshelfXml = '''<?xml version="1.0"?>
    <bookshelf>
      <book>
        <title lang="english">Growing a Language</title>
        <price>29.99</price>
      </book>
      <book>
        <title lang="english">Learning XML</title>
        <price>39.95</price>
      </book>
      <price>132.00</price>
    </bookshelf>''';

class ParsingDataModel {
  // final document = XmlDocument.parse(bookshelfXml);
  // final document = XmlDocument.parse(kavlingSvg);
  Future<String> loadAsset() async {
    return await rootBundle.loadString('images/kavling_2.svg');
  }

  final Xml2Json xml2Json = Xml2Json();

  void handleParsing() async {
    // final file = new File(await loadAsset());
    // final document = XmlDocument.parse(file.readAsStringSync());
    final document = XmlDocument.parse(await loadAsset());
    // final title = document.findAllElements('title');
    final rect = document.findAllElements('rect');
    final polygon = document.findAllElements('polygon');
    // print(document.toString());
    // print(document.toXmlString(pretty: true, indent: '\t'));
    // inspect(rect);
    // rect.map((node) {
    //   return node.getAttribute('width');
    // }).forEach(inspect);
    List<ShapeKavling> rectModel =
        rect.map((node) => ShapeKavling.fromMap(node)).toList();
    List<ShapeKavling> polygonModel =
        polygon.map((node) => ShapeKavling.fromMap(node)).toList();
    inspect(rectModel);
    inspect(polygonModel);
  }
}
