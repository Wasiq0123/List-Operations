import 'package:flutter/material.dart';

class SearchFunctionality extends StatefulWidget {
  const SearchFunctionality({super.key});

  @override
  State<SearchFunctionality> createState() => _SearchFunctionalityState();
}

class _SearchFunctionalityState extends State<SearchFunctionality> {
  List<String> data = []; // Original data
  List<String> filteredData = []; // Filtered data for search results
  final TextEditingController controller = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredData = data; // Initially, show all data
  }

  // Add Data
  void addData() {
    if (controller.text.isNotEmpty) {
      setState(() {
        data.add(controller.text);
        filteredData = List.from(data); // Update filtered list
        controller.clear();
      });
    }
  }

  // Search Data
  void searchData(String query) {
    setState(() {
      filteredData = data
          .where((x) => x.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Search Functionality')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Bar
              TextField(
                controller: searchController,
                onChanged: searchData, // Call search method on input change
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search data...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),

              // Display Filtered Data
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filteredData[index],
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Input Field to Add Data
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a value...',
                ),
              ),
              SizedBox(height: 20),

              // Button to Add Data
              ElevatedButton(
                onPressed: addData,
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
