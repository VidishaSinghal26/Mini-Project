import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget noteCard(Function()? onTap,QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: GoogleFonts.roboto(fontSize: 20,color: Colors.red),
          ),
           Text(
            doc["creation_date"],
            style: GoogleFonts.roboto(fontSize: 10,color: Colors.amber),
          ),
           Text(
            doc["note_content"],
            style: GoogleFonts.roboto(fontSize: 10,color: Colors.pink),
          )
        ],
      ),
    ),
  );
}