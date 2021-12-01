import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Home%20Screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String passw = "123456";
  bool password = true;
  String pass = "";
  gohomescree() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  showdialog() {
    setState(() {
      addDialogbox(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "images/2.gif",
                height: MediaQuery.of(context).size.height * 0.6,
              ),
            ),
            Center(
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: textfield(emailcontroller)),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      pass = value;
                    });
                  },
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    label: const Text("Password"),
                    prefixIcon: const Icon(Icons.vpn_key),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          password = !password;
                        });
                      },
                      icon: const Icon(Icons.visibility),
                    ),
                  ),
                  obscureText: password,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Colors.blue, width: 3),
                  minimumSize: Size(200, 60),
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    pass == passw ? gohomescree() : showdialog();
                  });
                },
                icon: Icon(Icons.logout),
                label: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {}, child: Text("Not Have an Account? Register."))
          ],
        ),
      ),
    );
  }

//appbar widget
  AppBar appbar() {
    return AppBar(
      backgroundColor: white,
      title: Text(
        "Login",
        style: TextStyle(
          color: Colors.orange,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget textfield(final emailcontroller) {
    return TextField(
      controller: emailcontroller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
        label: const Text("Email"),
        prefixIcon: const Icon(Icons.email),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => emailcontroller.clear(),
        ),
      ),
    );
  }

  void addDialogbox(
    BuildContext context,
  ) =>
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Wrong Password"),
          content: Text("Please try again"),
        ),
      );
}
