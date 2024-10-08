import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile_programming/models/cart_model.dart';

class MenuItem {
  final String name;
  final String description;
  final double rating;
  final String imageUrl;
  final int price;

  MenuItem({
    required this.name,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'rating': rating,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<MenuItem> cartItems = []; // List to hold cart items
  final NumberFormat currencyFormat = NumberFormat("#,##0", "id_ID");

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(
        name: 'Nasi Ayam Telur Asin',
        description:
            'Nasi dengan potongan ayam yang disajikan dengan bumbu telur asin yang khas.',
        rating: 4.8,
        imageUrl: 'assets/search1.png',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Cabai Garam',
        description:
            'Nasi dengan potongan ayam yang disajikan dengan bumbu cabai garam yang gurih.',
        rating: 4.7,
        imageUrl: 'assets/search2.png',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Kremes',
        description:
            'Nasi dengan potongan ayam yang disajikan dengan kremes yang crispy favorit semua orang.',
        rating: 4.6,
        imageUrl: 'assets/search3.png',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Bakar',
        description:
            'Nasi ayam bakar yang disajikan dengan bumbu khas restoran dan disajikan dengan nasi hangat yang pulen.',
        rating: 4.6,
        imageUrl: 'assets/search4.png',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Hainan',
        description:
            'Kelezatan tradisional nasi Hainan yang aromatik, dilengkapi saus manis dan asam yang istimewa. Wajib dicoba!.',
        rating: 4.3,
        imageUrl: 'assets/search5.png',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Lada Hitam',
        description:
            'Nasi dengan sajian potongan ayam lada hitam yang disajikan dengan bumbu otentik.',
        rating: 4.5,
        imageUrl: 'assets/search6.png',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Kungpau',
        description:
            'Nasi yang disajikan dengan ayam kungpau khas yang memiliki rasa otentik.',
        rating: 4.2,
        imageUrl: 'assets/search7.png',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Sambal Matah',
        description:
            'Nasi yang disajikan dengan potongan ayam dengan sambal matah yang segar favorit semua. Wajib dicoba!',
        rating: 4.2,
        imageUrl: 'assets/search8.png',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Teriyaki',
        description:
            'Nasi hangat yang disajikan dengan potongan ayam teriyaki yang memiliki perpaduan rasa manis dan gurih.',
        rating: 4.8,
        imageUrl: 'assets/search9.png',
        price: 23000,
      )
    ];

    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          "Menu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: true,
        actions: [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Box
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.orange),
                      hintText: 'Find Your Favorite Here!',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          // Menu Items List
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                        color: Colors.orange.withOpacity(0.5), width: 1.0),
                  ),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                item.imageUrl,
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    item.description,
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    'Rp ${currencyFormat.format(item.price)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 182, 111, 40),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[700],
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        item.rating.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8), // Space between rating and button
                        Align(
                          alignment: Alignment.centerRight, // Align button to the right
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false)
                                    .addItem(item.toMap());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF8811),
                                foregroundColor: Colors.black,
                                elevation: 5,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Tambah'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
