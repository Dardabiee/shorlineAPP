
import 'package:flutter/material.dart';
import 'model/beach_place.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({required this.place,super.key});
  final BeachPlace place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Stack(
        children: [
          LayoutBuilder(
             builder: (context, constraints) {
               double expandedHeight = 380;

               if(constraints.maxWidth >= 1200){
                expandedHeight = 700;
               } else if(constraints.maxWidth >= 800){
                expandedHeight = 600;
               } else if(constraints.maxWidth >= 600){
                expandedHeight = 600;
               }

               return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: expandedHeight,
                  backgroundColor: Colors.black,
                  actions: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        
                      ),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                        size: 30,
                        
                      ),
                    ),
                  ],
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(place.imageAsset),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.name,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2,),
                           Row(
                            children: [
                               const Icon(
                                Icons.fmd_good_rounded,
                                color: Colors.black38,
                              ),
                              Text(
                                "${place.location}, Indonesia",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          _boxInformation(constraints.maxWidth),
                           Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(place.description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500
                              ),
                            ),   
                          ),   
                             SizedBox(
                            width: double.infinity, // Tombol akan memenuhi lebar layar
                            child: ElevatedButton(
                              onPressed: () {
                                // Tambahkan aksi untuk tombol booking di sini
                                print('Booking button pressed');
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Book Now',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),      
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            );
             },
          ),
        ],
      ),
    );
  }

  Widget _boxInformation(double maxWidth) {
  // Mengatur lebar Container berdasarkan ukuran layar
  double containerWidth = 520;
  if (maxWidth >= 600) {
    containerWidth = 720; // Ukuran lebih besar jika layar >= 600
  }

  return Center(
    child: Container(
      width: containerWidth,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(3, 4))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 3),
                  Text(place.rate)
                ],
              ),
              Text(
                place.viewers,
                style: const TextStyle(color: Colors.black38),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 3),
                  Text('Open at')
                ],
              ),
              Text(
                place.openTimes,
                style: const TextStyle(color: Colors.black38),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.bookmark_outlined,
                    color: Colors.indigoAccent,
                  ),
                  SizedBox(width: 3),
                  Text('saved')
                ],
              ),
              Text(
                place.viewers,
                style: const TextStyle(color: Colors.black38),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

}