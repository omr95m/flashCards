
import 'package:flutter/material.dart';

class MotorDialog extends StatelessWidget {
  final Function(String)? onPressed;
  final TextEditingController controller;
  const MotorDialog({
    super.key, this.onPressed, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 100,
      child: Column(
        children: [
           TextField(
           controller: controller,
            decoration:const InputDecoration(hintText: 'Wright here'),
          ),
          const Spacer(),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              onPressed?.call(controller.text);
               Navigator.pop(context);
               controller.clear();
            },
            
            child: const Text('add'),)
        ],
      ),
    );
  }
}