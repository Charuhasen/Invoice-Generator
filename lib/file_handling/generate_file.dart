import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

class GenerateFile {
  void generateFile() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    final file = File('/Users/charu/Documents/example.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
