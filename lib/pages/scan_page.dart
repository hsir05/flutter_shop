import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      child: QrImage(
          data: "https://e.xitu.io/",
          size: 100.0,
    ));
  }
}