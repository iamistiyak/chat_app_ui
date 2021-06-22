import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:is_chat_app/database/data.dart';
import 'package:is_chat_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';


class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _sendMessageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey.withOpacity(1),
        elevation: 0,
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child:const Icon(
              Icons.arrow_back_ios,
              color: primary,
            )),
        title: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://st1.bollywoodlife.com/wp-content/uploads/2017/11/katrina-kaif.jpg?impolicy=Medium_Resize&w=1200&h=800"),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Katrina Kaif",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: black),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Active now",
                  style: TextStyle(color: black.withOpacity(0.4), fontSize: 14),
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          const Icon(
            LineIcons.video,
            color: primary,
            size: 32,
          ),
          const SizedBox(
            width: 15,
          ),
          const Icon(

            LineIcons.phone,
            color: primary,
            size: 35,
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
                color: online,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white38)),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }
  Widget getBottom(){
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent
        // borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30,right: 20,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

              // width: (MediaQuery.of(context).size.width- 40)/2,
              // width: (MediaQuery.of(context).size.width-10)/2,
            Row(
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width+150)/2,
                  height: 45,
                  decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextField(
                      cursorColor: black,
                      controller: _sendMessageController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Aa",
                        prefixIcon: Icon(Icons.tag_faces,color: Colors.grey,size: 35,),
                        suffixIcon: Icon(Icons.send, color: primary,)
                    ),
                  ),
                ),
                )],
            ),
             Container(
                  width: 50,
                    height: 50,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primary,
                      shape: BoxShape.circle
                    ),
                 child: Icon(Icons.keyboard_voice,size:25, color: Colors.white,)),

          ],
        ),

      ),
    );
  }

  Widget getBody() {
    
    return ListView(
      padding: EdgeInsets.only(right: 20,left: 20,top: 20,bottom: 80),
      children: List.generate(messages.length, (index){
        return Padding(
            padding: EdgeInsets.all(1),
            child: ChatBubble(isMe: messages[index]['isMe'],messageType: messages[index]['messageType'],message: messages[index]['message'],profileImg: messages[index]['profileImg'],));
      }),
    );
  }
}

//Create the chat content field
class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String profileImg;
  final String message;
  final int messageType;
  const ChatBubble({
   Key? key, required this.isMe, required this.profileImg, required this.message, required this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isMe){
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: primary,
                  // Decide the border of the chat content
                  borderRadius: getMessageType(messageType) 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: white,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }else{ //When isMe false -> Show the sender message + profile Image
      return Padding(
        padding:  EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            profileImg),
                        fit: BoxFit.cover)),
              ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: getMessageType(messageType) 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: black,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
    
  }
  getMessageType(messageType){
    if(isMe){
      // start message
      if(messageType == 1){
        return BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
        );
      }
      // middle message
      else if(messageType == 2){
        return BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
        );
      }
      // end message
      else if(messageType == 3){
        return BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
        );
      }
      // standalone message
      else{
        return BorderRadius.all(Radius.circular(30));
      }
    }
    // for sender bubble
    else{
      // start message
        if(messageType == 1){
          return BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)
          );
        }
        // middle message
        else if(messageType == 2){
          return BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)
          );
        }
        // end message
        else if(messageType == 3){
          return BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)
          );
        }
        // standalone message
        else{
          return const BorderRadius.all(Radius.circular(30));
        }
    }
    
    
  }
}
