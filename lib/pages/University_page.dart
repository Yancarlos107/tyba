import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tyba/models/university_model.dart';

class UniversityPage extends StatefulWidget {
  @override
  _UniversityPageState createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  File? imageFile;
  final TextStyle styles = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    final Universities university =
        ModalRoute.of(context)!.settings.arguments as Universities;
    return Scaffold(
        appBar: AppBar(
          title: Text(university.name),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: imageFile == null
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  'actualmente no hay ninguna foto de esta universidad, pero puedes subir una desde la galeria o desde tu camara',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 146, 163, 247))),
                                onPressed: () {
                                  _getFromGallery();
                                },
                                child: Text(
                                  "SELECCIONA DESDE LA GALERIA",
                                  style: styles.copyWith(color: Colors.white),
                                ),
                              ),
                              Container(
                                height: 40.0,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 146, 163, 247))),
                                onPressed: () {
                                  _getFromCamera();
                                },
                                child: Text("SELECCIONA DESDE LA CAMARA",
                                    style:
                                        styles.copyWith(color: Colors.white)),
                              )
                            ],
                          ),
                        )
                      : Container(
                          child: Image.file(
                            imageFile!,
                            fit: BoxFit.cover,
                          ),
                        )),
              Text(university.name, style: styles),
              Text('Web: ${university.webPages.first}', style: styles),
              Text('Country: ${university.country}', style: styles),
            ],
          ),
        ));
  }

  /// Get from gallery
  _getFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemp = File(image.path);
      setState(() {
        imageFile = imageTemp;
      });
    } on PlatformException catch (e) {
      return print('the error has $e');
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
