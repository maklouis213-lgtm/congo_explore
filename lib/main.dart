import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[100],

      // 🔻 Bottom Navigation
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // 🏠 HOME
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: Colors.white),
                      SizedBox(height: 4),
                      Text("Home", style: TextStyle(color: Colors.white)),
                    ],
                  ),

                  // 💳 RESERVATION
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ReservationScreen(),
                        ),
                      );
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.book_online, color: Colors.white),
                        SizedBox(height: 4),
                        Text(
                          "Réservation",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Rechercher un parc, animal...",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🏷️ Categories
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const CategoryChip(label: "🦍 Animaux"),

                    const SizedBox(width: 10),

                    const CategoryChip(label: "🌳 Parcs"),

                    const SizedBox(width: 10),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const VideoScreen(),
                          ),
                        );
                      },
                      child: const CategoryChip(label: "🎥 Vidéos"),
                    ),

                    const SizedBox(width: 10),

                    const CategoryChip(label: "📸 Photos"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 📸 Cards
              Expanded(
                child: ListView(
                  children: const [
                    PlaceCard(
                      title: "Parc des Virunga",
                      image:
                          "https://images.unsplash.com/photo-1508672019048-805c876b67e2?w=400",
                      subtitle: "Gorilles • Volcan",
                      distance: "1 km",
                    ),

                    PlaceCard(
                      title: "Parc de la Garamba",
                      image:
                          "https://images.unsplash.com/photo-1516426122078-c23e76319801?w=400",
                      subtitle: "Éléphants • Safari",
                      distance: "5 km",
                    ),

                    PlaceCard(
                      title: "Parc de Kahuzi-Biega",
                      image:
                          "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=400",
                      subtitle: "Randonnée • Nature",
                      distance: "3 km",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 💳 RESERVATION SCREEN

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Réservation"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            PaymentCard(title: "Visa", image: "assets/images/visa.png"),

            PaymentCard(
              title: "MasterCard",
              image: "assets/images/mastercard.png",
            ),

            PaymentCard(title: "PayPal", image: "assets/images/paypal.png"),

            PaymentCard(
              title: "Orange Money",
              image: "assets/images/orange.png",
            ),

            PaymentCard(
              title: "Airtel Money",
              image: "assets/images/airtel.png",
            ),

            PaymentCard(title: "M-Pesa", image: "assets/images/mpesa.png"),
            PaymentCard(
              title: "Airtel Money",
              image: "assets/images/western_union.png",
            ),
          ],
        ),
      ),
    );
  }
}

// 💳 PAYMENT CARD

class PaymentCard extends StatelessWidget {
  final String title;
  final String image;

  const PaymentCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          // 🖼️ LOGO
          Image.asset(image, width: 50, height: 50),

          const SizedBox(width: 20),

          // 📝 TITLE
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}

// 🎥 VIDEO SCREEN

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Visite Virtuelle"),
      ),

      body: ListView(
        children: const [
          VideoCard(
            title: "Parc des Virunga",
            image:
                "https://images.unsplash.com/photo-1508672019048-805c876b67e2?w=400",
          ),

          VideoCard(
            title: "Parc de la Garamba",
            image:
                "https://images.unsplash.com/photo-1516426122078-c23e76319801?w=400",
          ),

          VideoCard(
            title: "Parc de Kahuzi-Biega",
            image:
                "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=400",
          ),

          VideoCard(
            title: "Parc de la Salonga",
            image:
                "https://images.unsplash.com/photo-1472396961693-142e6e269027?w=400",
          ),

          VideoCard(
            title: "Parc de l'Upemba",
            image:
                "https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=400",
          ),

          VideoCard(
            title: "Parc de Maïko",
            image:
                "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400",
          ),

          VideoCard(
            title: "Parc de Kundelungu",
            image:
                "https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400",
          ),

          VideoCard(
            title: "Parc des Mangroves",
            image:
                "https://images.unsplash.com/photo-1426604966848-d7adac402bff?w=400",
          ),

          VideoCard(
            title: "Parc de la Lomami",
            image:
                "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=400",
          ),
        ],
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;
  final String image;

  const VideoCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 80,
              ),
            ),

            Positioned(
              left: 20,
              bottom: 20,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🧩 CATEGORY CHIP

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(label),
    );
  }
}

// 📸 PLACE CARD

class PlaceCard extends StatelessWidget {
  final String title;
  final String image;
  final String subtitle;
  final String distance;

  const PlaceCard({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📍 Distance
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on, color: Colors.white, size: 14),

                  const SizedBox(width: 4),

                  Text(
                    distance,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // 📌 Texte
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(subtitle, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
