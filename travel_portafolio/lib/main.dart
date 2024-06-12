import 'dart:io'; // Import necesario para trabajar con archivos
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() {
  runApp(TravelPortfolioApp());
}

class TravelPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portafolio de Viajes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
            debugShowCheckedModeBanner: false, 

      home: TravelPortfolioScreen(),
      
    );
  }
}

class TravelPortfolioScreen extends StatefulWidget {
  @override
  _TravelPortfolioScreenState createState() => _TravelPortfolioScreenState();
}

class _TravelPortfolioScreenState extends State<TravelPortfolioScreen> {
  final ImagePicker _picker = ImagePicker();
  List<String> _imagePaths = [];

  Future<void> _addPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePaths.add(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text('Portafolio de Viajes')),
      ),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(height: 4000.0),
              items: _imagePaths.map((path) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.file(File(path));
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.add_a_photo),
            label: Text('Agregar Foto'),
            onPressed: _addPhoto,
          ),
        ],
      ),
    );
  }
}
