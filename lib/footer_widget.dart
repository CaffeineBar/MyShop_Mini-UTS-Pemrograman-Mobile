import 'package:flutter/material.dart';

class ShopMallFooter extends StatelessWidget {
  const ShopMallFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1F2937), // Warna background gelap
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Cek lebar layar
          bool isDesktop = constraints.maxWidth > 800;

          if (isDesktop) {
            // --- TAMPILAN DESKTOP (Full Menyamping 4 Kolom) ---
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildAboutUs()), // Lebih lebar sedikit
                    const SizedBox(width: 40),
                    Expanded(child: _buildSocialMedia()),
                    const SizedBox(width: 40),
                    Expanded(child: _buildCategories()),
                    const SizedBox(width: 40),
                    Expanded(flex: 2, child: _buildContact()), // Lebih lebar sedikit
                  ],
                ),
                const SizedBox(height: 40),
                _buildCopyright(),
              ],
            );
          } else {
            // --- TAMPILAN MOBILE (Grid 2 Kolom Menyamping) ---
            // Agar tidak cuma lurus ke bawah, kita buat 2 kolom kiri-kanan
            double itemWidth = (constraints.maxWidth / 2) - 15; // Lebar per item (setengah layar)

            return Column(
              children: [
                Wrap(
                  spacing: 20,    // Jarak antar kolom kiri-kanan
                  runSpacing: 40, // Jarak antar baris atas-bawah
                  alignment: WrapAlignment.start,
                  children: [
                    SizedBox(width: itemWidth, child: _buildAboutUs()),
                    SizedBox(width: itemWidth, child: _buildSocialMedia()),
                    SizedBox(width: itemWidth, child: _buildCategories()),
                    SizedBox(width: itemWidth, child: _buildContact()),
                  ],
                ),
                const SizedBox(height: 40),
                _buildCopyright(),
              ],
            );
          }
        },
      ),
    );
  }

  // --- 1. BAGIAN TENTANG KAMI ---
  Widget _buildAboutUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Tentang Kami"),
        const Text(
          "ShopMall adalah toko online terpercaya yang menyediakan berbagai produk berkualitas dengan harga terjangkau.",
          style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.6),
        ),
      ],
    );
  }

  // --- 2. BAGIAN SOCIAL MEDIA ---
  Widget _buildSocialMedia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Social Media"),
        _buildIconText(Icons.facebook, "Facebook"),
        _buildIconText(Icons.music_note, "Twitter"), 
        _buildIconText(Icons.camera_alt, "Instagram"),
        _buildIconText(Icons.video_library, "Youtube"),
      ],
    );
  }

  // --- 3. BAGIAN KATEGORI ---
  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Kategori"),
        _buildLink("Makanan"),
        _buildLink("Minuman"),
        _buildLink("Elektronik"),
        _buildLink("Fashion"),
      ],
    );
  }

  // --- 4. BAGIAN KONTAK ---
  Widget _buildContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Kontak"),
        _buildIconText(Icons.location_on, "Jl. Contoh No. 123, Jakarta"),
        _buildIconText(Icons.phone, "+62 812 3456 7890"),
        _buildIconText(Icons.email, "info@shopmall.com"),
      ],
    );
  }

  // --- COPYRIGHT ---
  Widget _buildCopyright() {
    return Column(
      children: const [
        Divider(color: Colors.grey, thickness: 0.5),
        SizedBox(height: 20),
        Center(
          child: Text(
            "© 2023 ShopMall. Semua Hak Dilindungi.",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }

  // --- HELPER WIDGETS ---
  
  Widget _buildTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 40,
          height: 3,
          decoration: BoxDecoration(
            color: const Color(0xFF9C27B0), // Garis Ungu
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
    );
  }
}