import 'package:flutter/material.dart';

class PengembalianItem {
  final String title;
  final String author;
  final String genre;
  final bool isRead;
  final String imagePath;

  PengembalianItem(this.title, this.author, this.genre, this.isRead, this.imagePath);
}

class PengembalianScreen extends StatefulWidget {
  const PengembalianScreen({Key? key}) : super(key: key);

  @override
  State<PengembalianScreen> createState() => _PengembalianScreenState();
}

class _PengembalianScreenState extends State<PengembalianScreen> {
  final List<PengembalianItem> _pengembalianList = [
    PengembalianItem('Bumi Manusia', 'Pramoedya Ananta Toer', 'Novel', true, 'images/dilan.jpg'),
    PengembalianItem('Laut Bercerita', 'Leila S. Chudori', 'Novel', true, 'images/erere.jpeg'),
    PengembalianItem('Laut Bercerita', 'Leila S. Chudori', 'Novel', false, 'images/conan.jpeg'),
    // Add other data as needed
  ];

  @override
  Widget build(BuildContext context) {
    List<PengembalianItem> readItems = _pengembalianList.where((item) => item.isRead).toList();
    List<PengembalianItem> unreadItems = _pengembalianList.where((item) => !item.isRead).toList();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Return'),
      ),
      body: ListView(
        children: [
          if (unreadItems.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Currently on loan',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ...unreadItems.map((item) => _buildListItem(item, false)).toList(),
          ] else ...[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'No items currently on loan',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          if (readItems.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'It has been returned',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ...readItems.map((item) => _buildListItem(item, true)).toList(),
          ] else ...[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'No items have been returned',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildListItem(PengembalianItem item, bool showDeleteIcon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(item.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        if (showDeleteIcon)
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              size: 27.0,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                _pengembalianList.remove(item);
                              });
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Author: ${item.author}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Genre: ${item.genre}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
