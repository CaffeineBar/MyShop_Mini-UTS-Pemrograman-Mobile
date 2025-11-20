import 'package:flutter/material.dart';


class Product {
  final String name;
  final String description;
  final String price;
  final Color color;
  final IconData icon;
  final String categoryLabel;
  final String? imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.icon,
    required this.categoryLabel,
    this.imageUrl,
  });
}

// Data Dummy Sederhana (Tanpa Diskon)
List<Product> getProductsByCategory(String category) {
  if (category == 'Makanan') {
    return [
      Product(
        name: 'Pizza',
        price: 'Rp 25.000',
        description: 'Nikmati kelezatan pizza dengan bahan-bahan segar dan topping pilihan yang melimpah. Dengan adonan tipis yang renyah di luar dan lembut di dalam, pizza ini adalah pilihan sempurna untuk santapan bersama keluarga atau teman. Pilih dari berbagai varian rasa yang menggugah selera, mulai dari klasik Margherita hingga pizza premium dengan topping istimewa.',
        categoryLabel: 'Makanan',
        icon: Icons.local_pizza,
        color: Colors.red,
        imageUrl: "assets/images/pizza.jpg",
      ),
      Product(
        name: 'Burger Beef',
        price: 'Rp 15.000',
        description: 'Burger lezat dengan daging sapi berkualitas tinggi, disajikan dengan roti lembut dan bahan-bahan segar. Dipadukan dengan saus khas yang menggoda, burger ini adalah pilihan sempurna untuk kamu yang suka makanan cepat saji yang nikmat dan mengenyangkan. Tersedia juga variasi topping dan ukuran untuk menyesuaikan selera.',
        categoryLabel: 'Makanan',
        icon: Icons.lunch_dining,
        color: Colors.red,
        imageUrl: "assets/images/burger.jpg",
      ),
      Product(
        name: 'Sate Ayam',
        price: 'Rp 15.000',
        description: 'Sate ayam yang empuk dan lezat, dibumbui dengan rempah pilihan dan dipanggang sempurna. Disajikan dengan saus kacang yang kaya rasa dan nasi hangat, sate ayam ini menjadi pilihan ideal untuk santap malam yang menggugah selera. Nikmati cita rasa autentik yang penuh kenikmatan di setiap tusuknya.',
        categoryLabel: 'Makanan',
        icon: Icons.kebab_dining,
        color: Colors.red,
        imageUrl: "assets/images/sate_ayam.jpg",
      ),
    ];
  } else if (category == 'Minuman') {
    return [
      Product(
        name: 'Berry Smoothie',
        price: 'Rp 25.000',
        description: 'Smoothie segar dengan campuran buah berry pilihan, seperti stroberi, blueberry, dan raspberry. Diblender dengan yogurt atau susu untuk tekstur yang creamy dan rasa yang menyegarkan. Minuman ini kaya akan vitamin dan antioksidan, sempurna untuk kamu yang ingin menikmati camilan sehat dan lezat.',
        categoryLabel: 'Minuman',
        icon: Icons.local_bar,
        color: Colors.brown,
        imageUrl: "assets/images/berry_smoothie.jpg",
      ),
      Product(
        name: 'Matcha Latte',
        price: 'Rp 20.000',
        description: 'Sensasi lembut dan menenangkan dari Matcha Latte, terbuat dari bubuk matcha premium yang dicampur dengan susu segar, menghasilkan rasa yang creamy dan kaya. Perpaduan sempurna antara kehangatan dan rasa sedikit pahit dari matcha, cocok untuk kamu yang mencari minuman dengan rasa yang unik dan menyegarkan.',
        categoryLabel: 'Minuman',
        icon: Icons.local_drink,
        color: Colors.brown,
        imageUrl: "assets/images/matcha_latte.jpg",
      ),
    ];
  } else {
    // Elektronik
    return [
      Product(
        name: 'Kulkas Mini TaffHOME',
        price: 'Rp 457.800',
        description: 'Kulkas mini TaffHOME hadir dengan desain kompak dan efisien, cocok untuk ruang kecil seperti kamar tidur atau kantor. Dengan kapasitas yang ideal untuk menyimpan makanan dan minuman, kulkas ini dilengkapi dengan fitur pendinginan cepat dan hemat energi, memberikan kenyamanan tanpa mengorbankan ruang.',
        categoryLabel: 'Elektronik',
        icon: Icons.ac_unit,
        color: Colors.blueGrey,
        imageUrl: "assets/images/kulkas_mini_TaffHOME.jpg",
      ),
      Product(
        name: 'MBP mesin kopi semi automatic espresso',
        price: 'Rp 1.796.000',
        description: 'Nikmati kopi espresso berkualitas tinggi di rumah dengan MBP Mesin Kopi Semi Automatic. Dilengkapi dengan sistem pemanas yang stabil dan portafilter berkualitas, mesin ini memungkinkan Anda untuk membuat espresso, cappuccino, dan latte dengan mudah. Desainnya yang elegan dan fungsional membuatnya cocok untuk pecinta kopi sejati.',
        categoryLabel: 'Elektronik',
        icon: Icons.local_cafe,
        color: Colors.blueGrey,
        imageUrl: "assets/images/mesin_kopi.jpg",
      ),
    ];
  }
}