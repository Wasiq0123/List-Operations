import 'package:flutter/material.dart';

class ButtonColorSCreen extends StatefulWidget {
  const ButtonColorSCreen({super.key});

  @override
  State<ButtonColorSCreen> createState() => _ButtonColorSCreenState();
}

class _ButtonColorSCreenState extends State<ButtonColorSCreen> {
  int index = 0;
  @override
  void chnagecolr(int newindex) {
    setState(() {
      index = newindex;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Color Different State'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        index == 1 ? Colors.transparent : Colors.red,
                  ),
                  onPressed: () {
                    chnagecolr(1);
                  },
                  child: Text('Red'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        index == 2 ? Colors.green : Colors.transparent,
                  ),
                  onPressed: () {
                    chnagecolr(2);
                  },
                  child: Text('Green'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        index == 3 ? Colors.transparent : Colors.blue,
                  ),
                  onPressed: () {
                    chnagecolr(3);
                  },
                  child: Text('Blue'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
