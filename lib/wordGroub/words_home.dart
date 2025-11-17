import 'package:cards/wordGroub/aliart.dart';
import 'package:cards/wordGroub/namesContainer.dart';
import 'package:flutter/material.dart';

class WordGroubs extends StatefulWidget {
  const WordGroubs({super.key});

  @override
  State<WordGroubs> createState() => _WordGroubsState();
}

class _WordGroubsState extends State<WordGroubs> {
  List<String> groubA = [];
  List<String> groubB = [];
  List<String> groubC = [];
  List<String> groubD = [];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: MotorDialog(
                  controller: controller,
                  // onPressed: (value) {
                  //   setState(() {
                  //     final A = groubA.length;
                  //     final B = groubB.length;
                  //     final C = groubC.length;
                  //     final D = groubD.length;

                  //     if (A == B && A == C && A == D) {
                  //       groubA.add(value);
                  //     }
                  //    else if (A > B) {
                  //       groubB.add(value);
                  //     }
                  //  else   if (A == B&&B>C) {
                  //       groubC.add(value);
                  //     }
                  //  else   if (A == B || B == C||C>D) {
                  //       groubD.add(value);
                  //     }
                  //   });
                  // },
                  onPressed: (value) {
  setState(() {
    final lengths = {
      'A': groubA.length,
      'B': groubB.length,
      'C': groubC.length,
      'D': groubD.length,
    };

    // نبحث عن أقل مجموعة
    final smallest = lengths.values.reduce((a, b) => a < b ? a : b);

    if (groubA.length == smallest) groubA.add(value);
    else if (groubB.length == smallest) groubB.add(value);
    else if (groubC.length == smallest) groubC.add(value);
    // ignore: curly_braces_in_flow_control_structures
    else groubD.add(value);
  });
},

                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ContainerNAmes(
                      listNames: groubA,
                      groubChabital: 'A',
                      color: Colors.amber,
                    )),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    flex: 1,
                    child: ContainerNAmes(
                        groubChabital: 'B',
                        color: Colors.grey,
                        listNames: groubB))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ContainerNAmes(
                      groubChabital: 'C',
                      color: const Color.fromARGB(255, 214, 56, 44),
                      listNames: groubC,
                    )),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    flex: 1,
                    child: ContainerNAmes(
                      groubChabital: 'D',
                      color: Colors.green,
                      listNames: groubD,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
