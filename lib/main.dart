import 'package:flutter/material.dart';
import './list_places.dart';
import './list_activities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(15),
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Guatemala',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              Text('Corazon del mundo maya', style: TextStyle(fontSize: 15.5)),
            ]),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 330,
              //decoration: BoxDecoration(color: Colors.blue),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: List_lugares.length,
                itemBuilder: (context, index) {
                  return Cards(
                      titulo: List_lugares[index].titulo,
                      descripcion: List_lugares[index].descripcion,
                      img: List_lugares[index].img);
                },
              )),
          Container(
            margin: EdgeInsets.only(left: 31),
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Actividades',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ]),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              //decoration: BoxDecoration(color: Colors.red),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: List_Actividades.length,
                itemBuilder: (context, index) {
                  return Cards2(
                      nombre: List_Actividades[index].nombre,
                      tiempo: List_Actividades[index].tiempo,
                      precio: List_Actividades[index].precio,
                      img: List_Actividades[index].img);
                },
              )),
        ]),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards(
      {Key? key,
      required this.titulo,
      required this.descripcion,
      required this.img})
      : super(key: key);
  final String titulo;
  final String descripcion;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 35, left: 35),
      child: Container(
        width: 164,
        height: 248,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: ExactAssetImage(img),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 161, left: 13, right: 5),
              child: Text(titulo,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 13, right: 7, bottom: 9),
              child: Text(descripcion,
                  style: TextStyle(fontSize: 12, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class Cards2 extends StatelessWidget {
  const Cards2(
      {Key? key,
      required this.nombre,
      required this.tiempo,
      required this.precio,
      required this.img})
      : super(key: key);
  final String nombre;
  final String tiempo;
  final String precio;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 5, left: 15, right: 15),
      child: Container(
        width: 320,
        height: 86,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: ExactAssetImage(img),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 200,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(nombre,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              width: 100,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(tiempo,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(precio,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
