import 'package:flutter/material.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final Product product;

  ProductDescriptionWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(
        product.description,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Product {
  final String description;

  Product({required this.description});
}


class desc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Description Example'),
        ),
        body: ProductDescriptionWidget(
          product: Product(description: 'Novel Laskar Pelangi menceritakan kisah kehdiuoan 10 anak hebat yang memiliki semangat juang untuk tetap bersekolah di kampung Gantung, Kepulauan Bangka Belitung. Kesepuluh anak itu dinamai Laskar Pelangi, dan diantarnya bernama Ikal, Lintang, Sahara Aulia Fadillah, Mahar Ahlan, Syahdan Noor Aziz, Muhammad Jundullah Gufron Nur Zaman atau A kiong, Samson atau Borek, Mukharam Kudai Khairani, Trapani Ihsan Jamari, dan Harun Ardhili Ramadhan. Mereka semua bersekolah di SD Muhammadiyah Gantung dan dibimbing oleh Bu Muslimah dan Pak Harfan. Selama mereka bersekolah, mereka juga mendapatkan teman baru, seorang pindahan dari SD PN Timah bernama Flo. Cerita dimulai dari penerimaan siswa dan siswi baru di SD Muhammadiyah Gantung dimana hanya ada 9 orang murid yang mendaftat. Hal ini membuat Bu Muslimah, Pak Harfan, serta seluruh orang tua murid merasa cemas. Ini dikarenakan Pemerinta daerah setempat akan telah mengunumkan bahwa sekolah dasar Ini harus memiliki minmal 10 murid baru agar kegatan sekolah tetap berjalan. Karena murid ke 10 yang ditunggu tidak datang-datang juga, Dengan kekecewaan yang mendalam, Pak Harfan harus menetapkan keputusan yang berat. Namun, di tengah situasi tersebut, datanglah seorang murid baru yang menjadi penyelamat bagi sekolah, para murid baru, serta para orang tua atau wali. Murid ini bernama Harun Ardhli Ramadhan, seorang anak yang memiliki keterbelakangan mental namun memilki semangat yang tinggi untuk bersekolah. Kebersamaan mereka pun dimulai sejak saat itu.Selama menempuh pendidikan, Bu Muslimah dan Pak Harfan mengajar dan membimbing mereka dengan penuh semangat dan dedikasi. Para murid pun juga belajar dengan penuh semangat. Karena kekompakan dan semangat mereka, Bu Muslimah pun menjuluki mereka Laskar Pelangi. '),
        ),
      ),
    );
  }
}
