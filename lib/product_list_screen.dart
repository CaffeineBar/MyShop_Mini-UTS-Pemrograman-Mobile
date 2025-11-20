import 'package:flutter/material.dart';
import 'models.dart';
import 'product_detail_screen.dart';
import 'footer_widget.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = getProductsByCategory(categoryName);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4455FA),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Daftar Produk",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 1. Kolom TETAP 2
          int gridCount = 2;
          
          // 2. Aspect Ratio DINAMIS (Agar kartu tidak kepanjangan/kosong)
          double aspectRatio = 0.72; 

          if (constraints.maxWidth > 1000) {
            aspectRatio = 1.5; // Desktop
          } else if (constraints.maxWidth > 600) {
            aspectRatio = 1.1; // Tablet
          }

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kategori: $categoryName",
                          style: const TextStyle(
                            fontSize: 22, 
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                          ),
                        ),
                        const SizedBox(height: 20),

                        GridView.builder(
                          shrinkWrap: true, 
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: gridCount, 
                            childAspectRatio: aspectRatio,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return _buildSimpleProductCard(context, products[index]);
                          },
                        ),
                      ],
                    ),
                  ),

                  // Footer
                  Column(
                    children: const [
                      SizedBox(height: 40),
                      ShopMallFooter(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSimpleProductCard(BuildContext context, Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- BAGIAN GAMBAR (ASET LOKAL) & ICON BADGE ---
            Stack(
              children: [
                // 1. GAMBAR UTAMA (Layer Bawah)
                Container(
                  height: 120, // Tinggi area gambar
                  width: double.infinity,
                  color: Colors.grey[200], // Background jika gambar loading/transparan
                  child: product.imageUrl != null
                      ? Image.asset(
                          product.imageUrl!,
                          fit: BoxFit.cover,
                          // Error Builder: Jika file gambar tidak ditemukan di aset
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(Icons.broken_image, color: Colors.grey[400]),
                            );
                          },
                        )
                      : Center(child: Icon(Icons.image, color: Colors.grey[400])),
                ),

                // 2. ICON BADGE (Layer Atas - Pojok Kanan)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background putih agar ikon terlihat jelas
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      product.icon,
                      size: 18,
                      color: product.color, // Warna icon sesuai tema produk
                    ),
                  ),
                ),
              ],
            ),
            // -----------------------------------------------
            
            // Info Produk
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.category, size: 12, color: Colors.purple),
                      const SizedBox(width: 4),
                      Text(
                        product.categoryLabel.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8), 
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4455FA),
                    ),
                  ),
                ],
              ),
            ),
            
            const Spacer(), 

            // Tombol
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.blueAccent.withValues(alpha: 0.1),
              alignment: Alignment.center,
              child: const Text(
                "Lihat Detail",
                style: TextStyle(
                  color: Colors.blueAccent, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 12
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}