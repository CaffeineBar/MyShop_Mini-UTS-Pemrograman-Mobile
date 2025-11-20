import 'package:flutter/material.dart';
import 'models.dart';
import 'footer_widget.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], 
      
      appBar: AppBar(
        backgroundColor: const Color(0xFF4455FA),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Detail Produk",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  // KONTEN ATAS (Card Produk)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          // --- STACK GAMBAR DETAIL & BADGE KATEGORI ---
                          Stack(
                            children: [
                              // 1. Gambar Besar (Layer Bawah)
                              Container(
                                height: 250,
                                width: double.infinity,
                                color: Colors.grey[100],
                                child: product.imageUrl != null
                                    ? Image.asset(
                                        product.imageUrl!,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Center(
                                            child: Icon(Icons.broken_image, size: 50, color: Colors.grey[400]),
                                          );
                                        },
                                      )
                                    : Center(
                                        child: Icon(product.icon, size: 100, color: Colors.grey[300]),
                                      ),
                              ),

                              // 2. Badge Icon Kategori (Layer Atas - Pojok Kanan Bawah)
                              Positioned(
                                bottom: 16, 
                                right: 16,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.1), 
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(product.icon, color: product.color, size: 20),
                                      const SizedBox(width: 8),
                                      Text(
                                        product.categoryLabel,
                                        style: TextStyle(
                                          color: product.color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // ---------------------------------------------

                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.price,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4455FA),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Divider(color: Colors.grey[200], thickness: 1),
                                const SizedBox(height: 16),
                                const Text(
                                  "Deskripsi",
                                  style: TextStyle(
                                    fontSize: 16, 
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product.description,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('${product.name} ditambahkan!')),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF4455FA),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 0,
                                    ),
                                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                                    label: const Text(
                                      "Tambah ke Keranjang",
                                      style: TextStyle(
                                        fontSize: 16, 
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // FOOTER DI BAGIAN BAWAH
                  const ShopMallFooter(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}