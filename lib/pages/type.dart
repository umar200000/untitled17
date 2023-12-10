import 'package:flutter/material.dart';

class TypingPage extends StatefulWidget {
  const TypingPage({super.key});

  @override
  State<TypingPage> createState() => _TypingPageState();
}

class _TypingPageState extends State<TypingPage> {
  List<String> typing = [];
  late String str;

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat UI",
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Align(
                  alignment: index % 2 == 0
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Text(typing[index]),
                    decoration: BoxDecoration(
                        color: Color(0xff7BBDF7),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 10),
                          bottomLeft: Radius.circular(index % 2 == 0 ? 10 : 0),
                        )),
                  ),
                );
              },
              itemCount: typing.length,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            decoration: BoxDecoration(
                color: Color(0xffC9C9C9),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5),
                      border:
                          UnderlineInputBorder(borderSide: BorderSide.none)),
                )),
                IconButton(
                    onPressed: () {
                      fixSms();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
  }

  fixSms() async {
    setState(() {
      typing.add(textEditingController.text);
      str = textEditingController.text;
      textEditingController.clear();
    });
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        typing.add("User sms: $str");
      });
    });
  }
}
