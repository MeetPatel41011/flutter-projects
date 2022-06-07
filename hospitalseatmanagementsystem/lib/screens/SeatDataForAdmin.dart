import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SeatDataForAdmin extends StatefulWidget {
  SeatDataForAdmin();

  @override
  SeatDataForAdminState createState() => SeatDataForAdminState();
}

class SeatDataForAdminState extends State<SeatDataForAdmin> {
  SeatDataForAdminState();
//final docRef = db.collection("cities").doc("BJ");
final deleteController = TextEditingController();
var name = "";
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        child: TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            //border: OutlineInputBorder(),
            labelText: 'Enter Mild seat vacancy',
          ),
          controller: deleteController,
        ),
      ),
      
        ElevatedButton(
            onPressed: () {
              const Center(child: CircularProgressIndicator());
              
                name = deleteController.text;

                delete();
                //clearText();
          
            },
            child: Text('Delete Hospital')),

            ListView(
              children: [
                Scaffold(
        floatingActionButton: null,
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Hospital').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final booksDB = snapshot.data?.docs;
              List<Book> books = [];
              if (booksDB != null) {
                for (var rest in booksDB) {
                  Object? restName = rest.data();
                  //final restURL = rest.data['url'];

                  final book = Book(
                    name: restName.toString(),
                    //url: restURL,
                  );
                  books.add(book);
                }
              }

              return ListView(
                children: books,
              );
            }))
              ],
            )
    ],);
    
    
  }

  void delete() {
    CollectionReference firebasefirestore =
      FirebaseFirestore.instance.collection('Hospital');
    firebasefirestore.doc('name').update(
        {name: FieldValue.delete()}).whenComplete(() {
      print('Field Deleted');
    });
  }
}

class Book extends StatelessWidget {
  Book({required this.name});

  final String name;
  //final String url;
  
  @override
  Widget build(BuildContext context) {
    
    final final_height = MediaQuery.of(context).size.height / 2;
    final final_width = MediaQuery.of(context).size.width / 2;
    var mildController = TextEditingController();
    
    return Stack(
          children: <Widget>[
            Container(
                child: Card(
              color: Color.fromRGBO(4, 36, 73, 1),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.white)),
              elevation: 8,
              shadowColor: Colors.grey,
              child: Padding(
                padding: EdgeInsets.only(
                  top: final_height / 6,
                  bottom: final_height / 6,
                  right: 80,
                  left: 80,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '$name',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            )),
            SizedBox(
              height: 200,
            )
          ],
        );
      
    
  }

  
  
}
