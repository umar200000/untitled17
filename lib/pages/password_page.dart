import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled17/pages/main_page.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController textEditingController = TextEditingController();
  int controller = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: h * 0.13,
          ),
          Center(
            child: Image.asset(
              "assets/message.png",
              height: 80,
            ),
          ),
          SizedBox(
            height: h * 0.03,
          ),
          Center(
            child: Text(
              "Verification",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Center(
            child: Text(
              "you will get a OTP via SMS",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xffCFCDCE)),
            ),
          ),
          SizedBox(
            height: h * 0.22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Container(
              width: w,
              height: 50,
              child: TextField(
                controller: textEditingController,
                style: TextStyle(fontSize: 25),
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 150),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: controller == 2
                                ? Colors.red
                                : controller == 1
                                    ? Colors.green
                                    : Colors.grey.shade400)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: controller == 2
                                ? Colors.red
                                : controller == 1
                                    ? Colors.green
                                    : Colors.grey.shade400)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.035,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () {
                setState(() {
                  if (textEditingController.text.length != 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("must be 4 numbers")));
                    controller = 2;
                  } else {
                    controller = 1;
                    Future.delayed(Duration(milliseconds: 300), () {
                      Navigator.pushReplacement(context,
                          CupertinoPageRoute(builder: (context) => MainPage()));
                    });
                  }
                });
              },
              height: 50,
              minWidth: w,
              color: Color(0xff6445E9),
              child: Text(
                "VERIFY",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive the verification OTP?",
                style: TextStyle(color: Color(0xffCFCDCE)),
              ),
              SizedBox(
                width: 5,
              ),
              Text("Resend again", style: TextStyle(color: Color(0xff6445E9))),
            ],
          ),
        ],
      ),
    ));
  }
}
