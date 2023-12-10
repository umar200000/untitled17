import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled17/pages/type.dart';
import 'package:untitled17/tools/photo_name_page.dart';
import 'package:untitled17/tools/tool.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PhotoName photoName = PhotoName(phont: photos, name: names);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Conversations",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              leading: Icon(Icons.dehaze),
              actions: [
                Icon(Icons.message),
                SizedBox(
                  width: 12,
                )
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xffEFEFEF),
                    ),
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/cross.png",
                              height: 18,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(),
                          hintText: "Search for friends",
                          prefixIcon: Icon(Icons.search_rounded),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          container10(index, true),
                          Text(photoName.name[index])
                        ],
                      );
                    },
                    itemCount: photoName.phont.length,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: photoName.name.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => TypingPage()));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: container10(index, false),
                                ),
                                Text(photoName.name[index]),
                              ],
                            ),
                          );
                        })),
              ],
            )));
  }

  Container container10(int i, bool t) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: t ? 15 : 8),
        height: t ? 60 : 80,
        width: t ? 60 : 80,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(100)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            photoName.phont[i],
            fit: BoxFit.fill,
          ),
        ));
  }
}
