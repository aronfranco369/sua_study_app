import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ViewPDF extends StatefulWidget {
  const ViewPDF({Key? key}) : super(key: key);

  @override
  State<ViewPDF> createState() => _ViewPDFState();
}

class _ViewPDFState extends State<ViewPDF> {
  late PDFViewController _pdfViewController;
  int? currentPage = 0;
  int totalPages = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PDFView(
              filePath: '/storage/emulated/0/Android/data/com.aronfranco.study_app/files/COM.pdf',
              onPageChanged: (page, total) {
                setState(() {
                  currentPage = page;
                  totalPages = total!;
                });
              },
              onViewCreated: (PDFViewController pdfViewController) {
                setState(() {
                  _pdfViewController = pdfViewController;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '${currentPage! + 1}/$totalPages',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
