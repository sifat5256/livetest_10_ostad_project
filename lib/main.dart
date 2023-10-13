import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> selectedItems = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selected Items'),
                    SizedBox(height: 10,),
                    Text(
                      'Number of Selected items: ${selectedItems.where((selected) => selected).length}',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.done),
      ),
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              onTap: () {
                setState(() {
                  selectedItems[index] = !selectedItems[index];
                });
              },
              title: Text("Item ${index + 1}"),
              tileColor: selectedItems[index] ? Colors.red : null,
            );
          },
        ),
      ),
    );
  }
}
