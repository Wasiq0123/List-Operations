import 'package:flutter/material.dart';

class Exmaple3 extends StatefulWidget {
  const Exmaple3({super.key});

  @override
  State<Exmaple3> createState() => _Exmaple3State();
}

class _Exmaple3State extends State<Exmaple3> {
  String joiningletter = '';
  List<String> data = [];
  final controller = TextEditingController();

//method
  void add() {
    if (controller.text.isNotEmpty) {
      setState(() {
        data.add(controller.text);
        controller.clear();
      });
    }
  }

//string joing method
  void joining() {
    setState(() {
      joiningletter = data.join("");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List to String '),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Display Numbers
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index], style: TextStyle(fontSize: 18)),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),
              // Display List
              Text("List: ${data.toString()}", style: TextStyle(fontSize: 18)),

              SizedBox(height: 10),

              // Display Joined String
              Text("Joined: $joiningletter",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // Input Field
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a number',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),

              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: add,
                    child: Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: joining,
                    child: Text('joinig string'),
                  ),
                  // ElevatedButton(
                  //   onPressed: sortased,
                  //   child: Text('Sort Asc'),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
