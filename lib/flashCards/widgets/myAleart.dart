import 'package:flutter/material.dart';

class MyAleart extends StatefulWidget {
  final GlobalKey<FormState> globalKey;
  final Function(String)? onChanged1;
  final Function(String)? onChanged2;
  final Function()? buttonFunction;
  final List colorsList;
  final Function(Color)? onColorSelected;
  

 const MyAleart({
    super.key,
    required this.onChanged1,
    required this.onChanged2,
    required this.buttonFunction,
    required this.globalKey,
    required this.colorsList,
    required this.onColorSelected,
  });

  @override
  State<MyAleart> createState() => _MyAleartState();
}

class _MyAleartState extends State<MyAleart> {
    Color? selectedColor;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      child: SizedBox(
        height: 340,
        width: 200,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please Enter a word';
                } else {
                  return null;
                }
              },
              onChanged: widget.onChanged1,
              decoration: const InputDecoration(hintText: 'Enter a word'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please Enter a word';
                } else {
                  return null;
                }
              },
              onChanged: widget.onChanged2,
              decoration: const InputDecoration(hintText: 'Enter a word'),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 260,
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                   final color = widget.colorsList[index];
                final isSelected = selectedColor == color;
                 
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                      widget.onColorSelected?.call(color);
                    },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: isSelected ? Colors.black : Colors.transparent,width: 3),
                              color: color,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: widget.buttonFunction,
              child: const Text('save'),
            ),
          ],
        ),
      ),
    );
  }
}
