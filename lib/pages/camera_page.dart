import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image = $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('camera'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            image != null
                ? Image.file(
                    image!,
                    width: 160,
                    height: 160,
                  )
                : FlutterLogo(size: 160),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: TextButton(
                onPressed: () => pickImage(ImageSource.gallery),
                child: Text('Pick Gallery'),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () => pickImage(ImageSource.camera),
              child: Text('Pick Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
