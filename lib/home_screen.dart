import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> data = [];
  final controller = TextEditingController();

  //add data Method
  void addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        data.add(controller.text);
        controller.clear();
      });
    }
  }

  //Remove Data methos
  void removedata() {
    setState(() {
      data.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List Opeartions'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Text(data[index]);
                        }),
                  ),
                ),
              ],
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter the data'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      addTask();
                    },
                    child: Text('Add')),
                ElevatedButton(
                    onPressed: () {
                      removedata();
                    },
                    child: Text('Remove'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
