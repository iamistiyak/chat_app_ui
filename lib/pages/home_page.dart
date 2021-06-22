import 'package:flutter/material.dart';
import 'package:is_chat_app/database/data.dart';
import 'package:is_chat_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

import 'chat_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://media-exp1.licdn.com/dms/image/C4D03AQGNIcCPkjtTbw/profile-displayphoto-shrink_200_200/0/1605810182489?e=1624492800&v=beta&t=uk4jVvE-uYb8evDmo-xbhoGb5y528rarBDigg1YWp4Y"),
                        fit: BoxFit.cover)),
              ),
              const Text(
                "Chats",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.edit)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: grey, borderRadius: BorderRadius.circular(15)),
            child: TextField(
              cursorColor: black,
              controller: _searchController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    LineIcons.search,
                    color: black.withOpacity(0.5),
                  ),
                  hintText: "Search Here",
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: grey),
                        child: const Center(
                          child: Icon(
                            LineIcons.plus,
                            size: 33,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 75,
                        child: Align(
                            child: Text(
                          'Your Story',
                          overflow: TextOverflow.ellipsis,
                        )),
                      )
                    ],
                  ),
                ),
                Row(
                    children: List.generate(userStories.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 75,
                          height: 75,
                          child: Stack(
                            children: <Widget>[
                              userStories[index]['story']
                                  ? Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: blue_story, width: 3)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          width: 75,
                                          height: 75,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      userStories[index]['img']),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  userStories[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                              userStories[index]['online']
                                  ? Positioned(
                                      top: 48,
                                      left: 52,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: online,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: white, width: 3)),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 75,
                          child: Align(
                              child: Text(
                            userStories[index]['name'],
                            overflow: TextOverflow.ellipsis,
                          )),
                        )
                      ],
                    ),
                  );
                }))
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: List.generate(userMessages.length, (index) {
              return InkWell(
                hoverColor: Colors.deepPurple,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ChatDetailPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 75,
                        height: 75,
                        child: Stack(
                          children: <Widget>[
                            userMessages[index]['story']
                                ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: blue_story, width: 3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    userMessages[index]['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                userMessages[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                            userMessages[index]['online']
                                ? Positioned(
                                    top: 48,
                                    left: 52,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: online,
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: white, width: 3)),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            userMessages[index]['name'],
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 135,
                            child: Text(
                              userMessages[index]['message'] +
                                  " - " +
                                  userMessages[index]['created_at'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: black.withOpacity(0.8)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          )
      ],
    ));
  }
}
