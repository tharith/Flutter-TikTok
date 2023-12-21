import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // this holds a list of fiction users
  // you can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "ថាវរិទ្ធ", "age": 29, "address" : "ភ្នំពេញ"},
    {"id": 2, "name": "Aragon", "age": 40, "address" : "LA"},
    {"id": 3, "name": "Bob", "age": 5, "address" : "London"},
    {"id": 4, "name": "Barbara", "age": 35, "address" : "Paris"},
    {"id": 5, "name": "Candy", "age": 21, "address" : "Berlin"},
    {"id": 6, "name": "Colin", "age": 55, "address" : "Bangkok"},
    {"id": 7, "name": "Audra", "age": 30, "address" : "Tokyo"},
    {"id": 8, "name": "Banana", "age": 14, "address" : "Singapore"},
    {"id": 9, "name": "Caversky", "age": 100, "address" : "New York"},
    {"id": 10, "name": "Becky", "age": 32, "address" : "Toulouse"},
  ];

  // this list holds the data for the list view
  List<Map<String, dynamic>> _foundUser = [];
  @override
  void initState() {
    // at the beginning, all users are shown
    _foundUser = _allUsers;
    super.initState();
  }

  // this function is called whenever the text field changes
  void _runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enterKeyword.toLowerCase())
      ).toList();
    }

    // refresh the UI
    setState(() {
      _foundUser = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search", style: TextStyle(fontFamily: "KantumruyProBold"),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: "Search", suffixIcon: Icon(Icons.search)
              ),
            ),
            const SizedBox(height: 10.0,),
            Expanded(
              child: _foundUser.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUser.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUser[index]["id"]),
                  color: Colors.white54,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.star, color: Colors.orangeAccent,),
                      title: Text(
                        "Name: ${_foundUser[index]["name"]}",
                        style: const TextStyle(
                          fontFamily: "KantumruyProBold",

                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Age: ${_foundUser[index]["age"]}",
                            style:  TextStyle(
                              fontFamily: "KantumruyProLigh",
                              color: Colors.grey[900],
                              fontSize: 16
                            ),
                          ),
                          Text(
                            "Address: ${_foundUser[index]["address"]}",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[900],
                              fontFamily: "KantumruyProLigh"
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              )
              : const Column(
                children: [
                  Icon(Icons.warning, color: Colors.red, size: 30,),
                  Text(
                    "No results found.",
                    style: TextStyle(
                      fontFamily: "KantumruyProLigh",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
