import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'thirdpage.dart';

class MyFileList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFileList();
  }
}

class _MyFileList extends State<MyFileList> {
  var files;

  void getFiles() async {
    //asyn function to get list of files
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0]
        .appFilesDir; //storageInfo[1] for SD card, geting the root directory
    var fm = FileManager(root: Directory(root)); //
    files = await fm.filesTree();
    setState(() {
      MyFileList();
    }); //update the UI
  }

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state.
    super.initState();
  }

  String temp = '';
  List<String> imagepath = [];
  String addimagepath(String p) {
    imagepath.add(p);
    print('we added this file : $p');
    temp = p.split('/').last;
    return temp;
  }

  @override
  deletefiles(File diro) {
    diro.delete();
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => MyFileList()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
                context, new MaterialPageRoute(builder: (context) => second())),
          ),
          title: Text("File/Folder list from SD Card"),
          backgroundColor: Colors.redAccent),
      body: files == null
          ? Text("Searching Files")
          : ListView.builder(
              //if file/folder list is grabbed, then show here
              itemCount: files?.length ?? 0,
              itemBuilder: (context, index) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 94,
                    minHeight: 99,
                    maxWidth: 104,
                    maxHeight: 104,
                  ),
                  child: Card(
                    child: Center(
                      child: ListTile(
                        title: Text(addimagepath(files[index].path)),
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 94,
                            minHeight: 99,
                            maxWidth: 104,
                            maxHeight: 104,
                          ),
                          child: Image.file(File(files[index].path),
                              fit: BoxFit.cover),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deletefiles(File(files[index].path)),
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
