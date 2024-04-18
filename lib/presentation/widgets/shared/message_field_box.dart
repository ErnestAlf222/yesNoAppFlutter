import 'package:flutter/material.dart';


class MessageFieldBox extends StatelessWidget {
  
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key, 
    required this.onValue
    });

  @override
  Widget build(BuildContext context) {

    //? Nos da control del input que se asocia
    final textController = TextEditingController();

    final focusNode = FocusNode();


    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent ),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
          hintText: 'In your message "?"',
          filled: true,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          suffixIcon:  IconButton(
          icon: const  Icon( Icons.send),
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
        ),
      );


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 11),
      
      child: TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        controller: textController,
        decoration: inputDecoration,
        focusNode: focusNode,
        
        onFieldSubmitted: (value) {
          textController.clear();
          focusNode.requestFocus();
          onValue(value);
        },
       
    
      ),
    );
  }
}