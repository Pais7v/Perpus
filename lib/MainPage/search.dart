import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchBarDemo(),
    );
  }
}

class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  TextEditingController _controller = TextEditingController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Bar Demo'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 50, // Jumlah item contoh
              itemBuilder: (context, index) {
                // Disini Anda dapat menentukan logika untuk menampilkan item
                // sesuai dengan kata kunci pencarian _searchText
                return _buildCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(int index) {
    // Disini Anda dapat menyesuaikan konten Card sesuai kebutuhan
    return Card(
      child: ListTile(
        title: Text('Item $index'),
        subtitle: Text('Description of item $index'),
        onTap: () {
          // Aksi yang dijalankan ketika item diklik
        },
      ),
    );
  }
}
