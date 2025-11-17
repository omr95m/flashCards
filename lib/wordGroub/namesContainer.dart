import 'package:flutter/material.dart';

class ContainerNAmes extends StatelessWidget {
  final String groubChabital;
  final Color color;

  final List<String> listNames;
  // ignore: non_constant_identifier_names
  const ContainerNAmes({
    super.key,
    required this.color,
    required this.listNames,
    required this.groubChabital,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             Text(
                    'Groub $groubChabital ',
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
            Expanded(
              child: ListView.builder(
                itemCount: listNames.length,
                itemBuilder: (context, index) {
                  print(listNames.length);
                  return Text(
                    listNames[index],
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
