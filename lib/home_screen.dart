
import 'package:flutter/material.dart';
import 'package:shorline_app/detail_screen.dart';
import 'package:shorline_app/model/beach_place.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:LayoutBuilder(
        builder: (context, constraints) {
             int gridCount = _getGridCount(constraints.maxWidth);

             return ListView(
             children: [
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left:14, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/markzuberk.jpeg'),
                          ),
                          Icon(Icons.bookmark,
                          color: Colors.blue,
                          size: 40,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello, Mark!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           ),
                          ),
                          Text('Gabut? Pantai yuk!',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600
                           ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 26, 22, 22).withOpacity(0.11),
                            blurRadius: 40,
                            spreadRadius: 0.0
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10, right: 10 ),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(153, 229, 227, 227),
                            contentPadding: const EdgeInsets.all(16),
                            hintText: 'Search here...',
                             hintStyle: const TextStyle(
                                fontSize: 14
                              ),
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none
                            )
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('#ForYourHoliday',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text('See all',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    _diskonSection(),
                    const SizedBox(height: 10,),
                    _buildBeachGrid(gridCount)
              ],
            ),
          ],
        );
        },
      )//listview
    );
  }
   // Fungsi untuk menentukan jumlah kolom berdasarkan lebar layar
  int _getGridCount(double maxWidth) {
    if (maxWidth >= 1200) {
      return 5; // Untuk layar sangat lebar
    } else if (maxWidth >= 800) {
      return 3; // Untuk layar sedang seperti tablet
    } else {
      return 2; // Untuk layar lebih kecil seperti ponsel
    }
  }

  Widget _buildBeachGrid(int gridCount) {
    return Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            shrinkWrap: true, // Agar GridView tidak scroll secara independen
            physics: const NeverScrollableScrollPhysics(), // Agar bisa di-controll oleh ListView
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16, // Jarak horizontal antara grid
        mainAxisSpacing: 16, // Jarak vertikal antara grid
        childAspectRatio: 0.65, // Rasio aspek item grid
            ),
            itemCount: beachPlaceList.length,
            itemBuilder: (context, index) {
        final BeachPlace place = beachPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(place: place,)));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Latar belakang putih untuk item grid
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300), // Menambahkan border
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          place.imageAsset, // Ganti dengan gambar yang diinginkan
                          fit: BoxFit.cover, // Mengisi seluruh Container dengan gambar
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      const Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: Text(
                    place.name, // Ganti dengan nama produk yang sesuai
                    style: const  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Rp. ${place.ticketPrice}', // Ganti dengan harga produk yang sesuai
                    style:  const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on),
                      Text(
                        place.location, // Ganti dengan kategori produk yang sesuai
                        style: const  TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
            },
          ), 
        );
  }

// Widget Diskon Section
Widget _diskonSection() {
  return LayoutBuilder(
    builder: (context, constraints) {
      double containerHeight = 200;

      // Jika lebar layar 1200 piksel atau lebih, ubah tinggi container
      if (constraints.maxWidth >= 1000) {
        containerHeight = 400; // Tinggi lebih besar untuk layar lebar
      } else if(constraints.maxWidth >= 800){
        containerHeight = 300;
      }

      return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: containerHeight,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/penida-beach.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      const Positioned(
                        top: 16,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GET YOUR SPECIAL',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'UP TO 50%',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: 16,
                        left: 16,
                        child: Text(
                          'Enjoy before it run out!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

}