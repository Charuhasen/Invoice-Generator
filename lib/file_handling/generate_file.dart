import 'dart:io';

import 'package:docx_template/docx_template.dart';
import 'package:flutter/services.dart';

class GenerateFile {
  void generateFile() async {
    
    final data = await rootBundle.load('lib/assets/template.docx');
    final bytes = data.buffer.asUint8List();

    final docx = await DocxTemplate.fromBytes(bytes);

    final listNormal = ['Foo', 'Bar', 'Baz'];
    final listBold = ['ooF', 'raB', 'zaB'];

    final contentList = <Content>[];

    final b = listBold.iterator;
    for (var n in listNormal) {
      b.moveNext();

      final c = PlainContent("value")
        ..add(TextContent("normal", n))
        ..add(TextContent("bold", b.current));
      contentList.add(c);
    }

    Content c = Content();
    c
      ..add(TextContent("docname", "Simple docname"))
      ..add(TextContent("passport", "CHARUHASEN"))
      ..add(TableContent("table", [
        RowContent()
          ..add(TextContent("key1", "Paul"))
          ..add(TextContent("key2", "Viberg"))
          ..add(TextContent("key3", "Engineer")),
        RowContent()
          ..add(TextContent("key1", "Alex"))
          ..add(TextContent("key2", "Houser"))
          ..add(TextContent("key3", "CEO & Founder"))
          ..add(ListContent("tablelist", [
            TextContent("value", "Mercedes-Benz C-Class S205"),
            TextContent("value", "Lexus LX 570")
          ]))
      ]));

    final d = await docx.generate(c);
    final of = File('lib/assets/generated.docx');
    if (d != null) await of.writeAsBytes(d);
  }
}
