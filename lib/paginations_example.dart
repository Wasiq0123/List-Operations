import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fetch_apis.dart';

class PaginationsExample extends StatefulWidget {
  const PaginationsExample({super.key});

  @override
  State<PaginationsExample> createState() => _PaginationsExampleState();
}

class _PaginationsExampleState extends State<PaginationsExample> {
  bool isLoading = false;
  late Future<List<MyModel>> futurePosts; // Store the future here

  // Fetch data directly as a list
  Future<List<MyModel>> getdata() async {
    setState(() {
      isLoading = true; // Start loading
    });

    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false; // Stop loading
      });
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData
          .map((item) => MyModel.fromJson(item))
          .toList(); // Direct return
    } else {
      setState(() {
        isLoading = false; // Stop loading on error
      });
      throw Exception('Data Not Found');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePosts = getdata(); // Initialize the future only once
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<MyModel>>(
              future: futurePosts, // Use the stored future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child:
                          CircularProgressIndicator()); // Show loading spinner
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Error: ${snapshot.error}')); // Show error
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Text('No data found')); // Show no data message
                } else {
                  // Display the list of data
                  List<MyModel> mydata = snapshot.data!;
                  return ListView.builder(
                    itemCount: mydata.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(mydata[index].title), // Fixed variable name
                      );
                    },
                  );
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                futurePosts = getdata(); // Refresh data
              });
            },
            child: Text('Load More'),
          ),
        ],
      ),
    );
  }
}

// Define the MyModel class
