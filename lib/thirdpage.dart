import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file/file.dart' as f;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
// import 'package:backendless_sdk/backendless_sdk.dart';
import 'deletepage.dart';

final Directory _photoDir = new Directory(
    '/storage/emulated/0/Android/data/com.example.secrete_vault/files/Pictures');

class second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/self': (context) => second(),
        '/delete': (context) => MyFileList(),
      },
      title: 'Document Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageCapture(),
    );
  }
}

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  f.File _storedImage;
  Future<void> _cameratakePicture() async {
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    setState(() {
      // _storedImage = imageFile;
      second();
    });
  }

  Future<void> _gallerytakePicture() async {
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    setState(() {
      // _storedImage = imageFile;
      second();
    });
  }

  Future<void> _onpressflottingbutton() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(),
          backgroundColor: Colors.red,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () => _cameratakePicture().then(
                    (value) => Navigator.pop(context),
                  ),
                  child: Text(
                    "Take From Camera",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                GestureDetector(
                  onTap: () => _gallerytakePicture().then(
                    (value) => Navigator.pop(context),
                  ),
                  child: Text(
                    "Select From Gallery",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secrete Gallery'),
        actions: <IconButton>[
          IconButton(
            onPressed: () => _onpressflottingbutton(),
            icon: Icon(Icons.add_a_photo),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/delete'),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: creategrid(),
    );
  }
}

creategrid() {
  return Container(
    child: FutureBuilder(
      builder: (context, status) {
        return ImageGrid(directory: _photoDir);
      },
    ),
  );
}

class ImageGrid extends StatelessWidget {
  final Directory directory;

  const ImageGrid({Key key, this.directory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var refreshGridView;
    var imageList = directory
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".jpg"))
        .toList(growable: false);
    return GridView.builder(
      itemCount: imageList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 3.0 / 4.6),
      itemBuilder: (context, index) {
        File file = new File(imageList[index]);
        String name = file.path.split('/').last;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () => {},
              child: Padding(
                padding: new EdgeInsets.all(4.0),
                child: Image.file(
                  File(imageList[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//deleting the file from its original place after copying it into the app.
