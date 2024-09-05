

class BeachPlace{
  String name;
  String location;
  String description;
  String openTimes;
  String viewers;
  String rate;
  String ticketPrice;
  String imageAsset;

  BeachPlace({
  required this.name,
  required this.location,
  required this.description,
  required this.openTimes,
  required this.viewers,
  required this.rate,
  required this.ticketPrice,
  required this.imageAsset,
  });

}
 var beachPlaceList = [
  BeachPlace(
    name: 'Nusa Penida', 
    location: 'Bali', 
    description: 'Nusa Penida adalah sebuah pulau bagian dari Kabupaten Klungkung, Bali, Indonesia yang terletak di sebelah tenggara Bali yang dipisahkan oleh Selat Badung. Di dekat pulau ini terdapat juga pulau-pulau kecil lainnya yaitu Nusa Ceningan dan Nusa Lembongan.', 
    openTimes: '6 am', 
    viewers: '1 jt viewers', 
    rate: '5.0', 
    ticketPrice:'500.000' ,
    imageAsset: 'assets/images/penida-beach.jpg'
    ),
    
    BeachPlace(
    name: 'Turun Aban', 
    location: 'Bangka', 
    description: 'Pesona pantai di Bangka seakan tak ada habisnya. Di sisi timur pulau, ada Pantai Turun Aban yang cantik dan berhias batu granit berukuran besar.Mengisi liburan, Pulau Bangka sepertinya layak dimasukkan sebagai salah satu destinasi alternatif yang harus didatangi.', 
    openTimes: 'Everyday', 
    viewers: '302rb viewers', 
    rate: '4.3', 
    ticketPrice:'40.000' ,
    imageAsset: 'assets/images/turun-aban.jpg'
    ),

    BeachPlace(
    name: 'Batu Belig', 
    location: 'Kuta', 
    description: 'Pantai Batu Belig berada di sebuah desa bernama Batu Belig yang berada di Kecamatan Kuta Utara, Kabupaten Badung.', 
    openTimes: 'Everyday', 
    viewers: '872rb viewers', 
    rate: '4.0', 
    ticketPrice:'50.000' ,
    imageAsset: 'assets/images/batu-belig.jpg'
    ),

    BeachPlace(
    name: 'Batu Bengkung', 
    location: 'Malang', 
    description: 'Hamparan pantai dengan formasi batuan & berlatar tempat makan, terkenal dengan berenang & matahari terbenam.Pantai Batu Bengkung ada pada kolam alaminya. Kolam ini hanya dapat kamu temui saat setelah air laut pasang di mana air laut akan terjebak di sebuah cekungan yang berada di bibir pantai. Cekungan ini dikelilingi oleh deretan batu karang besar di sepanjang pantai. Air yang terjebak inilah yang menjadi sebuah kolam alami.', 
    openTimes: 'Everyday', 
    viewers: '72rb viewers', 
    rate: '4.1', 
    ticketPrice:'50.000' ,
    imageAsset: 'assets/images/batu-bengkung.jpg'
    ),

    BeachPlace(
    name: 'Karang Bebai', 
    location: 'Lampung', 
    description: 'Pantai Karang Bebai atau Karang Bebay terletak di Pekon Tengor, Kecamatan Cukuh Balak, Kabupaten Tanggamus, Lampung.  Cukuh Balak terkenal dengan pantainya yang masih asli dan indah untuk dikunjungi.', 
    openTimes: 'Everyday', 
    viewers: '170rb viewers', 
    rate: '3.8', 
    ticketPrice:'30.000' ,
    imageAsset: 'assets/images/karang-bebai.jpg'
    ),
   
    BeachPlace(
    name: 'Pantai Ngudel', 
    location: 'Malang', 
    description: 'Salah satu daya tarik dari Pantai Ngudel adalah hamparan pasir putih yang bersih dan lautan biru sejauh mata memandang. Bagi kamu yang ingin bersantai di tepi pantainya, kamu bisa membawa tikar atau alas agar bisa duduk di pasir. Sambil duduk, kamu bisa menikmati keindahan lautan biru yang menenangkan pikiran dan hati.', 
    openTimes: 'Everyday', 
    viewers: '170rb viewers', 
    rate: '3.8', 
    ticketPrice:'35.000' ,
    imageAsset: 'assets/images/pantai-ngudel.jpg'
    ),
 ];