import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_clone/shared/notes_style.dart';

class NoteEditor extends StatefulWidget {
  const NoteEditor({super.key});

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  int color_id = Random().nextInt(NotesStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor:NotesStyle.cardsColor[color_id], 
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Add a new Note",style: TextStyle(color: Colors.black),),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: GoogleFonts.roboto(fontSize: 18.0,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0,),
            Text(date,style: GoogleFonts.roboto(fontSize: 13.0,fontWeight: FontWeight.w500),),
             SizedBox(height: 28.0,),

             TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Content',
              ),
              style: GoogleFonts.nunito(fontSize: 16.0,fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () async{
          FirebaseFirestore.instance.collection("Notes").add({
            "note_title":_titleController.text,
            "creation_date":date,
            "note_content": _mainController.text,
            "color_id":color_id,
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("Failed to add new note $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}