import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_clone/shared/notes_style.dart';

class NoteReader extends StatefulWidget {
   NoteReader(this.doc,{Key? key}):super(key:key);
   QueryDocumentSnapshot doc;

  @override
  State<NoteReader> createState() => _NoteReaderState();
}

class _NoteReaderState extends State<NoteReader> {
  
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: NotesStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: NotesStyle.cardsColor[color_id],
        elevation: 0.0,
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: GoogleFonts.roboto(fontSize: 18.0,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5,),
             Text(
              widget.doc["creation_date"],
              style: GoogleFonts.roboto(fontSize: 13.0,fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15,),
             Text(
              widget.doc["note_content"],
              style: GoogleFonts.nunito(fontSize: 16.0,fontWeight: FontWeight.normal),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}