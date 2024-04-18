import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no/domain/entities/message.dart';

import 'package:yes_no/presentation/providers/chat_provider.dart';
import 'package:yes_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding:  EdgeInsets.only(left: 7, top: 7),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://miro.medium.com/v2/resize:fill:128:128/1*BKAUQgV3GYUWGAUGr-ypgQ.png'),
          ),
        ),
        title: const Text('Linda'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}


class _ChatView extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                
                final message = chatProvider.messageList[index];
                
                return ( message.fromWho == FromWho.hers)
                        ?  HerMessageBubble( message: message)
                        :  MyMessageBubble( message: message );
               
                
              },
            )
           ),
            
            // Caja de texto
             MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value)
             ),
          ],
        ),
      ),
    );
  }
}