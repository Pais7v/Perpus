import 'package:flutter/material.dart'; 
 
class PengembalianItem { 
  final String title; 
  final String description; 
  final bool isRead; 
  final String imagePath; 
 
  PengembalianItem(this.title, this.description, this.isRead, this.imagePath); 
} 
 
class PengembalianScreen extends StatefulWidget { 
  const PengembalianScreen({Key? key}); 
 
  @override 
  State<PengembalianScreen> createState() => _PengembalianScreenState(); 
} 
 
class _PengembalianScreenState extends State<PengembalianScreen> { 
  final List<PengembalianItem> _pengembalianList = [ 
    PengembalianItem('Bumi Manusia', 'By Pramoedya Ananta Toer', true, 
        'images/dilan.jpg'), 
    PengembalianItem('Laut Bercerita', 'By Leila S. Chudori', true, 
        'images/dilan.jpg'), 
    PengembalianItem('Laut Bercerita', 'By Leila S. Chudori', false, 
        'assets/images/laut_bercerita.jpg'), 
    // Add other data as needed 
  ]; 
 
  @override 
  Widget build(BuildContext context) { 
    List<PengembalianItem> readItems = 
        _pengembalianList.where((item) => item.isRead).toList(); 
    List<PengembalianItem> unreadItems = 
        _pengembalianList.where((item) => !item.isRead).toList(); 
 
    return Scaffold( 
      appBar: AppBar( 
        leading: IconButton( 
          icon: const Icon(Icons.arrow_back, color: Colors.white), 
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
          ], 
        ], 
      ), 
    ); 
  } 
 
  Widget _buildListItem(PengembalianItem item, bool showDeleteIcon) { 
    return Card( 
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
      child: ListTile( 
        contentPadding: const EdgeInsets.all(16.0), 
        leading: Container( 
          width: 150.0, // Set a larger fixed width 
          height: 200.0, // Set a larger fixed height 
          decoration: BoxDecoration( 
            image: DecorationImage( 
              image: AssetImage(item.imagePath), 
              fit: BoxFit.cover, // Maintain aspect ratio and cover the entire container 
            ), 
            borderRadius: BorderRadius.circular(8.0), // Optional: add rounded corners 
          ), 
        ), 
        title: Text( 
          item.title, 
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), 
        ), 
        subtitle: Text( 
          item.description, 
          style: const TextStyle(fontSize: 14, color: Colors.grey), 
        ), 
        trailing: showDeleteIcon 
            ? IconButton( 
                icon: const Icon(Icons.delete, color: Colors.red), 
                onPressed: () { 
                  setState(() { 
                    _pengembalianList.remove(item); 
                  }); 
                }, 
              ) 
            : null, 
      ), 
    ); 
  } 
}