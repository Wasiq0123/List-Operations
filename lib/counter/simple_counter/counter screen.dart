import 'package:flutter/material.dart';

class CounterSCreen extends StatefulWidget {
  const CounterSCreen({super.key});
  @override
  State<CounterSCreen> createState() => _CounterSCreenState();
}

class _CounterSCreenState extends State<CounterSCreen> {
  int counter = 0;
  @override
  void icrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        icrementCounter();
      }),
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text('$counter', style: TextStyle(fontSize: 40)))
          ],
        ),
      ),
    );
  }
}
