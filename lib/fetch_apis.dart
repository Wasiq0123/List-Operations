import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Define the MyModel class
class MyModel {
  final int id;
  final String title;

  MyModel({required this.id, required this.title});

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      id: json['id'],
      title: json['title'],
    );
  }
}

class FetchApisScreen extends StatefulWidget {
  FetchApisScreen({super.key});

  @override
  State<FetchApisScreen> createState() => _FetchApisScreenState();
}

class _FetchApisScreenState extends State<FetchApisScreen> {
  List<MyModel> data = [];
  bool isLoading = false; // Fixed typo

  /// Fetch data from the API
  Future<void> getdata() async {
    setState(() {
      isLoading = true;
    });

    // Use a valid API URL (e.g., JSONPlaceholder)
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        data = jsonData.map((item) => MyModel.fromJson(item)).toList();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    getdata(); // Fetch data when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch APIs'),
      ),
      body: Column(
        children: [
          Expanded(
            // Use Expanded to make the ListView take up remaining space
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index].title),
                        subtitle: Text('ID: ${data[index].id}'),
                      );
                    },
                  ),
          ),
          ElevatedButton(
            onPressed: getdata,
            child: Text('Refresh'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FetchApisScreen(),
  ));
}
