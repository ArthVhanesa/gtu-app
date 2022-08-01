// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gtu_app/utils/pdf_api.dart';
import 'package:gtu_app/style/style.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:path/path.dart';

class PdfViewer extends StatefulWidget {
  final String url;
  const PdfViewer({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  final AppColors _colors = AppColors();
  final FontStyle _style = FontStyle();

  late PDFViewController controller;
  int? pages = 0;
  int? indexPage = 0;
  String? name;

  @override
  Widget build(BuildContext context) {
    final text = '[${indexPage! + 1} of $pages]';

    void toastMessage({required String message}) {
      Fluttertoast.showToast(
        msg: message,
        fontSize: 16,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: _colors.blackColor),
          //Pdf viewer Appbar title
          title: Text(
            name == null ? 'PDF Viewer' : name!.substring(0, name!.length - 4),
            style: _style.manrope(18, FontWeight.w500).copyWith(
                  color: _colors.blackColor,
                ),
          ),
          actions: pages! >= 2
              ? [
                  Center(
                      child: Text(
                    text,
                    style: _style.manrope(15, FontWeight.w500).copyWith(
                          color: _colors.blackColor,
                        ),
                  )),
                  IconButton(
                    icon: const Icon(Icons.chevron_left, size: 32),
                    onPressed: () {
                      // final page = indexPage == 0 ? pages : indexPage! - 1;

                      if (indexPage == 0) {
                        //toast message 'first page'
                        toastMessage(message: 'First page');
                      } else {
                        final page = indexPage! - 1;
                        controller.setPage(page);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, size: 32),
                    onPressed: () {
                      // final page = indexPage == pages! - 1 ? 0 : indexPage! + 1;

                      if (indexPage == pages! - 1) {
                        //toast message 'last page'
                        toastMessage(message: 'Last page');
                      } else {
                        final page = indexPage! + 1;
                        controller.setPage(page);
                      }
                    },
                  ),
                ]
              : null,
          backgroundColor: _colors.bgColor,
        ),
        body: FutureBuilder<File>(
          future: PDFApi.loadNetwork(widget.url),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  height: 80, // size of indicator
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballClipRotateMultiple,
                    colors: [_colors.primaryColor], // color of incdicator
                  ),
                ),
              );
            } else {
              final file = snapshot.data;
              name = basename(file!.path);
              return PDFView(
                filePath: file.path,
                autoSpacing: false,
                pageSnap: false,
                pageFling: false,
                onRender: (pages) => setState(() => this.pages = pages),
                onViewCreated: (controller) =>
                    setState(() => this.controller = controller),
                onPageChanged: (indexPage, _) =>
                    setState(() => this.indexPage = indexPage),
              );
            }
          },
        ));
  }
}
