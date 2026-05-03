import 'package:flutter/material.dart';

class ProdukPage extends StatelessWidget {
  const ProdukPage({super.key});

  void _showCheckoutSheet(
    BuildContext context,
    String nama,
    String harga,
    String icon,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(icon, style: const TextStyle(fontSize: 60)),
              const SizedBox(height: 10),
              Text(
                nama,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                harga,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Yeay! Pesanan berhasil masuk ke keranjang. Lanjutkan ke pembayaran?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pesanan berhasil dibuat! 🌸'),
                      backgroundColor: Colors.pinkAccent,
                    ),
                  );
                },
                child: const Text(
                  'Checkout Sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> itemProduk = [
      {'nama': 'WDP ML', 'harga': 'Rp 28.000', 'icon': '💎'},
      {'nama': 'Diamond ML', 'harga': 'Rp 20.000', 'icon': '✨'},
      {'nama': 'Starlight Basic', 'harga': 'Rp 35.000', 'icon': '🌟'},
      {'nama': 'Starlight Premium', 'harga': 'Rp 70.000', 'icon': '👑'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Produk 🎀'),
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: itemProduk.length,
        itemBuilder: (context, index) {
          final produk = itemProduk[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.pink.shade100, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(produk['icon']!, style: const TextStyle(fontSize: 48)),
                const SizedBox(height: 8),
                Text(
                  produk['nama']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  produk['harga']!,
                  style: const TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    _showCheckoutSheet(
                      context,
                      produk['nama']!,
                      produk['harga']!,
                      produk['icon']!,
                    );
                  },
                  child: const Text(
                    'Pilih',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
