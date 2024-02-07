import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PopupSizeGuide extends StatefulWidget {
  final String sizedimage;

  PopupSizeGuide({
    Key? key,
    required this.sizedimage,
  }) : super(key: key);

  @override
  State<PopupSizeGuide> createState() => _InfoPopupState();
}

class _InfoPopupState extends State<PopupSizeGuide> {
  late PdfViewerController _pdfViewerController;
  late Future<String> _fileExtension;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _fileExtension = _getFileExtension();
  }

  Future<String> _getFileExtension() async {
    // Mocking API call to get file extension
    // Replace this with actual API call to fetch file extension from the API data
    await Future.delayed(Duration(seconds: 1));

    // Logic to extract the file extension (e.g., from API response)
    if (widget.sizedimage.toLowerCase().endsWith('.pdf')) {
      return 'pdf';
    } else {
      return 'image';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        height: Get.height / 1.45,
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.close, color: gold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder<String>(
                future: _fileExtension,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      if (snapshot.data == 'pdf') {
                        return Container(
                          color: Colors.green,
                          height: Get.height / 1.7,
                          child: SfPdfViewer.network(
                            "${AppConstants.BASE_URL}${widget.sizedimage ?? ""}",
                            controller: _pdfViewerController,
                          ),
                        );
                      } else {
                        // Display a network image if not a PDF
                        return Container(
                          // color: Colors.red,
                          height: Get.height / 1.7,
                          child: Image.network(
                            "${AppConstants.BASE_URL}${widget.sizedimage ?? ""}",
                            fit: BoxFit.fill,
                          ),
                        );
                      }
                    } else {
                      // Handle error state or no data scenario
                      return Text('Error loading file');
                    }
                  } else {
                    // Display a loading indicator
                    return Container(
                      // color: Colors.blue,
                      height: Get.height / 1.7,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),



            SizedBox(height: 15),
            Center(
              child: Text(
                "NOT SURE ABOUT SIZE?",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "Return & Exchange Policy",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
