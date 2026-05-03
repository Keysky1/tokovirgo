import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final List<String> _ratings = [
    "Pelayanan sangat cepat! ✨",
    "Seller ramah banget 🌸",
  ];

  void _showAddRatingDialog() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Tulis Rating Kamu 🎀'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Masukkan ulasan di sini...",
            border: InputBorder.none,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
            onPressed: () {
              setState(() {
                if (controller.text.isNotEmpty) _ratings.add(controller.text);
              });
              Navigator.pop(context);
            },
            child: const Text('Kirim', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating Pelanggan ⭐'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: _ratings.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(_ratings[index]),
              trailing: const Icon(Icons.star, color: Colors.orangeAccent),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddRatingDialog,
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add_comment_rounded, color: Colors.white),
      ),
    );
  }
}
