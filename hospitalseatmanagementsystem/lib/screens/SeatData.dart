import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SeatData extends StatefulWidget {
  SeatData();

  @override
  SeatDataState createState() => SeatDataState();
}

class SeatDataState extends State<SeatData> {
  SeatDataState();

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Hospital').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final booksDB = snapshot.data?.docs;
            List<Book> books = [];
            if(booksDB != null){
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
           
              })
            );
          }
    
  }


class Book extends StatelessWidget {
  Book({required this.name});

  final String name;
  //final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Text('$name'),
          
        ),
        SizedBox(
          height: 200,
        )
       
      ],
    );
  }
}