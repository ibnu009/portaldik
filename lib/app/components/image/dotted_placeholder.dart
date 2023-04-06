import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DottedPlaceHolder extends StatelessWidget {
  const DottedPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        strokeCap: StrokeCap.round,
        color: Colors.black54,
        radius: const Radius.circular(8),
        dashPattern: const [5, 5],
        child: const SizedBox(
          height: 300,
          width: 250,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              CupertinoIcons.camera_fill,
              color: Colors.black54,
              size: 64,
            ),
          ),
        ),
      ),
    );
  }
}
