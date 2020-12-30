import 'package:flutter/material.dart';
import 'package:secrete_vault/thirdpage.dart';
// import 'package:secrete_vault/fourthpage.dart';

//Material app for calling the calculator

class nextpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        '/first': (context) => second(),
        '/second': (context) => setting1(),
        '/third': (context) => password1(),
        '/fourth': (context) => about1(),
      },
      home: Calcula(),
    );
  }
}

// Representation of a calculator---------------------------------------------
String texts = "";
String pass = "1+2=";
String oldpass = "1+2=";
String newpass = "";
String username = "Bhaskar";
String email = "bhaskarchander2@gmail.com";
String number = "9761652918";

class Calcula extends StatefulWidget {
  @override
  _CalculaState createState() => _CalculaState();
}

//calculator calculation part.

class _CalculaState extends State<Calcula> {
  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operatortoperform;
  String vault = "";
  void btnclicked(String btnval) {
    vault = vault + btnval;
    if (btnval == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      vault = "";
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "/" ||
        btnval == "x") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      } else if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      } else if (operatortoperform == "/") {
        res = (firstnum / secondnum).toString();
      } else if (operatortoperform == "x") {
        res = (firstnum * secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }
    setState(() {
      if (vault == pass) {
        Navigator.pushNamed(context, '/first');
      } else {
        texttodisplay = res;
      }
    });
  }

//for making the custom buttons

  Widget custombutton(String btnvalue) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnvalue),
        child: Text(
          "$btnvalue",
        ),
      ),
    );
  }

//popup menue bar code.

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: new RelativeRect.fromLTRB(100.0, 0.0, 0.0, 100.0),
      items: [
        PopupMenuItem(
          child: ListTile(
              title: Text("Setting"),
              onTap: () => Navigator.pushNamed(context, '/second')),
        ),
        PopupMenuItem(
          child: ListTile(
              title: Text("Password"),
              onTap: () => Navigator.pushNamed(context, '/third')),
        ),
        PopupMenuItem(
          child: ListTile(
              title: Text("About"),
              onTap: () => Navigator.pushNamed(context, '/fourth')),
        ),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  _showPopupMenu();
                  // print("btnpressed");
                },
              )),
        ],
        backgroundColor: Colors.red,
        title: Text(
          "Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "$texttodisplay",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Setting page----------------------------------------------------------------

class setting1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/pop': (context) => setting1(),
        '/passwords': (context) => password1(),
        '/updateprofile': (context) => updatepro(),
      },
      home: setting2(),
    );
  }
}

class setting2 extends StatefulWidget {
  @override
  _setting2State createState() => _setting2State();
}

class _setting2State extends State<setting2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.settings),
        title: Text("Setting"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: Center(
                      child: Text(
                        "Update Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/updateprofile'),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: Center(
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/passwords'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Update Profile ----------------------------------------------------------.

class updatepro extends StatefulWidget {
  @override
  _updateproState createState() => _updateproState();
}

class _updateproState extends State<updatepro> {
  String text = "";
  changemail(int t) {
    email = text;
  }

  changename(int t) {
    username = text;
  }

  changephone(int t) {
    number = text;
  }

  void showbox(int a) {
    if (a == 1) {
      showDialog(
        barrierColor: Colors.red,
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            autofocus: true,
            maxLength: 20,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: OutlineInputBorder(gapPadding: 40.0),
              labelText: "Enter New Username",
              // hintText: 'old password',
            ),
            style: TextStyle(fontSize: 25.0),
            onChanged: (texts) {
              text = texts;
            },
          ),
          title: Text("Change Username"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => {
                changename(1),
                Navigator.pop(context),
              },
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => {
                Navigator.pop(context),
              },
            ),
          ],
        ),
      );
    } else if (a == 2) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            autofocus: true,
            maxLength: 80,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: OutlineInputBorder(gapPadding: 40.0),
              labelText: "Enter New Mail ID",
              // hintText: 'old password',
            ),
            style: TextStyle(fontSize: 25.0),
            onChanged: (texts) {
              text = texts;
            },
          ),
          title: Text("Change Mail"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => {
                changemail(1),
                Navigator.pop(context),
              },
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => {
                Navigator.pop(context),
              },
            ),
          ],
        ),
      );
    } else if (a == 3) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            autofocus: true,
            maxLength: 80,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: OutlineInputBorder(gapPadding: 40.0),
              labelText: "Enter New Phone",
              // hintText: 'old password',
            ),
            style: TextStyle(fontSize: 25.0),
            onChanged: (texts) {
              text = texts;
            },
          ),
          title: Text("Change Phone"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => {
                changephone(1),
                Navigator.pop(context),
              },
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => {
                Navigator.pop(context),
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Profile"),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80.0,
                    child: ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text(
                        "$username",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            onPressed: () => showbox(1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80.0,
                    child: ListTile(
                      leading: Icon(Icons.mail),
                      title: Text(
                        "$email",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            onPressed: () => showbox(2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80.0,
                    child: ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(
                        "$number",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            onPressed: () => showbox(3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// About Page---------------------------------------------------------------.

class about1 extends StatefulWidget {
  @override
  _about1State createState() => _about1State();
}

class _about1State extends State<about1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("About"),
      ),
    );
  }
}

//Password Page----------------------------------------------------------------
class password1 extends StatefulWidget {
  password1({Key key}) : super(key: key);

  @override
  _password1State createState() => _password1State();
}

class _password1State extends State<password1> {
  String copy = "";
//   String texts = "";
// String pass = "1+2=";
// String oldpass = "1+2=";
// String newpass = "";
  void showsucess(int a) {
    if (a == 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password Incorrect"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
              // SystemChannels.platform.invokeMethod('Systemnavigator.pop'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password Succesfully Changed"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
              // SystemChannels.platform.invokeMethod('Systemnavigator.pop'),
            ),
          ],
        ),
      );
    }
  }

  void checkpassword() {
    if (oldpass == pass) {
      if (newpass == copy) {
        pass = newpass;
        showsucess(1);
      } else {
        showsucess(0);
      }
    } else {
      showsucess(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Password"),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  autofocus: true,
                  maxLength: 10,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(gapPadding: 40.0),
                    labelText: "Enter Old Password",
                    // hintText: 'old password',
                  ),
                  style: TextStyle(fontSize: 25.0),
                  onChanged: (texts) {
                    oldpass = texts;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  autofocus: true,
                  maxLength: 10,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(gapPadding: 40.0),
                    labelText: "Enter New Password",
                    // hintText: 'old password',
                  ),
                  style: TextStyle(fontSize: 25.0),
                  onChanged: (texts) {
                    newpass = texts;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  autofocus: true,
                  maxLength: 10,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(gapPadding: 40.0),
                    labelText: "Enter New Password Again",
                    // hintText: 'old password',
                  ),
                  style: TextStyle(fontSize: 25.0),
                  onChanged: (texts) {
                    copy = texts;
                  },
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text("Submit"),
                  onPressed: () => checkpassword(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
