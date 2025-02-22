import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  List<int> number = [];

  final TextEditingController controller = TextEditingController();

  // Add Number
  void addnum() {
    if (controller.text.isNotEmpty) {
      //covert number into string
      var num = int.tryParse(controller.text.toString());
      if (num != null) {
        setState(() {
          number.add(num);
          controller.clear();
        });
      }
    }
  }

  // Filter Even Numbers
  void evennum() {
    setState(() {
      number = number.where((num) => num.isEven).toList();
    });
  }

  // Sort in Ascending Order
  void sortased() {
    setState(() {
      //  '.sort()'  Sorting method  are automatically Covert into acesinding order
      number.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('List Operations')),
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
                  itemCount: number.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(number[index].toString(),
                          style: TextStyle(fontSize: 18)),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

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
                    onPressed: addnum,
                    child: Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: evennum,
                    child: Text('Even Num'),
                  ),
                  ElevatedButton(
                    onPressed: sortased,
                    child: Text('Sort Asc'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
