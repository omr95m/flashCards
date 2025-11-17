import 'package:cards/flashCards/widgets/myAleart.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> firstGrobWords = [];
  List<String> secondGrobWords = [];
  List<bool> changWordSide = [];
  late String firstFiled;
  late String secondFiled;
  List<Color> colors = [
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.grey
  ];
  List<Color> colorsContainer = [];
  Color? selectedColor;

  GlobalKey<FormState> globalKey = GlobalKey();

  bool xx = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: MyAleart(
                  //***** */
                  onColorSelected: (color) {
                    selectedColor = color;
                  }, //****** */

                  colorsList: colors,
                  globalKey: globalKey,
                  onChanged1: (value1) {
                    firstFiled = value1;
                  },
                  onChanged2: (value2) {
                    secondFiled = value2;
                  },
                  buttonFunction: () {
                    if (globalKey.currentState!.validate()) {
                      setState(() {
                        globalKey.currentState!.save();
                        firstGrobWords.add(firstFiled);
                        secondGrobWords.add(secondFiled);
                        changWordSide.add(false);
                        Navigator.of(context).pop();
                        colorsContainer.add(selectedColor ?? Colors.orange);
                      });
                    }
                  },
                  // child:
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'Card game',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: firstGrobWords.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    changWordSide[index] = !changWordSide[index];
                  });
                },
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: colorsContainer[index],
                            borderRadius: BorderRadius.circular(5)),
                        height: 100,
                        width: 100,
                        child: Center(
                            child: Text(changWordSide[index]
                                ? firstGrobWords[index]
                                : secondGrobWords[index]))),
                  ],
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
