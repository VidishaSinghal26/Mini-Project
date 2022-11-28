import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_clone/shared/notes_style.dart';

Widget noteCard(Function()? onTap,QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: NotesStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: GoogleFonts.roboto(fontSize: 18.0,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6,),
           Text(
            doc["creation_date"],
            style: GoogleFonts.roboto(fontSize: 13.0,fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10,),
           Text(
            doc["note_content"],
            style: GoogleFonts.nunito(fontSize: 16.0,fontWeight: FontWeight.normal),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ),
  );
}