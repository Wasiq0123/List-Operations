import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:list_topic/counter/getx_counter/counter_controoler.dart';

class CounterSCreenwithGetx extends StatelessWidget {
  const CounterSCreenwithGetx({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterControoler());
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.icrement();
      }),
      appBar: AppBar(
        title: Text('Counter Screen with Getx'),
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Obx(() => Text("${controller.counter.value}",
                    style: TextStyle(fontSize: 40))))
          ],
        ),
      ),
    );
  }
}
