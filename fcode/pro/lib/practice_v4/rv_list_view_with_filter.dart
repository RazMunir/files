import 'package:flutter/material.dart';

class RvListViewWithFilter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RvListViewWithFilter();
  }
}

class _RvListViewWithFilter extends State<RvListViewWithFilter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.length > 0
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(_foundUsers[index]["id"]),
                          color: Colors.amberAccent,
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Text(
                              _foundUsers[index]["id"].toString(),
                              style: TextStyle(fontSize: 24),
                            ),
                            title: Text(_foundUsers[index]['name']),
                            subtitle: Text(
                                '${_foundUsers[index]["age"].toString()} years old'),
                          ),
                        );
                      },
                    )
                  : Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            )
          ],
        ),
      ),
    );
  }

  // You can use data fetched from a database or cloud as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers.where((user) =>
          user['name'].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
}
