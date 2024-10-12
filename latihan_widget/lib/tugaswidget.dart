import 'package:flutter/material.dart';

class GaleriFoto extends StatelessWidget {
  const GaleriFoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeri Foto"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(
              "https://picsum.photos/id/13/400/200",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 200,
            width: double.infinity,
            child: Center(
              child: const Text(
                "Salah Satu Pantai di Indonesia",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              Text("Lokasi: Pantai Kambang Iwak"),
              Icon(
                Icons.calendar_month,
                color: Colors.blue,
              ),
              Text("Publikasi: 12 Oktober 2024")
            ],
          ),
        ],
      ),
    );
  }
}
