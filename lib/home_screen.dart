import 'package:flutter/material.dart';
import 'product_list_screen.dart';
import 'footer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar disesuaikan agar mirip referensi (Warna Biru + Ikon)
      appBar: AppBar(
        backgroundColor: const Color(0xFF4455FA), // Warna biru mirip referensi
        title: Row(
          children: const [
            Icon(Icons.shopping_bag, color: Colors.white), // Ikon tas
            SizedBox(width: 10),
            Text(
              "MyShop Mini",
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 2. HERO SECTION (Banner Atas)
            // Menggunakan Container gelap sebagai pengganti gambar background
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A), // Background gelap mirip foto
                // Jika ingin pakai gambar asli nanti, ganti color dengan:
                // image: DecorationImage(image: AssetImage('assets/banner.jpg'), fit: BoxFit.cover),
              ),
              child: Column(
                children: const [
                  Text(
                    "Temukan Kebutuhan Terbaik Anda",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Berbagai pilihan produk berkualitas dengan harga terbaik untuk memenuhi kebutuhan sehari-hari Anda",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // 3. BAGIAN KATEGORI (Fitur Utama Tugas)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Judul Section Kategori
                  const Text(
                    "Kategori Produk",
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                    ),
                  ),
                  // Garis bawah dekoratif
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 24),
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4455FA),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  
                  // Row berisi 3 Card Kategori (Fitur Wajib)
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildCategoryCard(
                          context, 
                          "Makanan", 
                          Icons.restaurant, 
                          "Pilihan lezat bergizi.",
                          Colors.orange.shade100,
                          Colors.orange
                        ),
                        const SizedBox(width: 8),
                        _buildCategoryCard(
                          context, 
                          "Minuman", 
                          Icons.local_cafe, 
                          "Segarkan harimu.",
                          Colors.teal.shade100,
                          Colors.teal
                        ),
                        const SizedBox(width: 8),
                        _buildCategoryCard(
                          context, 
                          "Elektronik", 
                          Icons.devices, 
                          "Teknologi canggih.",
                          Colors.grey.shade300,
                          Colors.blueGrey
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const ShopMallFooter(),
          ],
        ),
      ),
    );
  }

  // Widget Card Kustom (Tetap sama untuk menjaga fitur navigasi)
  Widget _buildCategoryCard(
    BuildContext context, 
    String title, 
    IconData icon, 
    String description,
    Color bgColor,
    Color iconColor
  ) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // Navigasi Wajib
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductListScreen(categoryName: title),
              ),
            );
          },
          child: Column(
            children: [
              // Header Warna
              Container(
                height: 70,
                width: double.infinity,
                color: bgColor, 
                child: Icon(icon, size: 35, color: iconColor),
              ),
              // Konten Teks
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      title, 
                      style: const TextStyle(
                        fontSize: 13, 
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 10, 
                        color: Colors.grey
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Tombol Visual
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 4, right: 4),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4455FA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Lihat Produk",
                    style: TextStyle(color: Colors.white, fontSize: 9),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}