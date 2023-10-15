import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LocalPdfViewerScreen extends StatefulWidget {
  static String tag = '/local_pdf_viewer';

  final bool isDirect;

  LocalPdfViewerScreen({this.isDirect = false});

  @override
  _LocalPdfViewerScreenState createState() => _LocalPdfViewerScreenState();
}

class _LocalPdfViewerScreenState extends State<LocalPdfViewerScreen> {
  PdfViewerController pdfViewerController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    // Specify the path to the PDF file.
    final String pdfFilePath = '';

    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.file(
        File(pdfFilePath), // Load the PDF from the provided path.
        controller: pdfViewerController,
      ),
    );
  }
}
