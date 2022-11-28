import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/pages/note_editor.dart';
import 'package:zoom_clone/pages/note_reader.dart';
import 'package:zoom_clone/widgets/notes_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(actions: [],
      title: Text("MyNotes",),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 1, 47, 100),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Notes").snapshots() ,
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(snapshot.hasData){
                return GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  children: snapshot.data!.docs.map((note)=> noteCard((){
                    Navigator.push(context, MaterialPageRoute(
                      builder: 
                      (context)=> NoteReader(note)
                      ));
                  }, note)).toList(),);
              }
            
            return Text("there's no notes");
            }
            
            ),
        )
      ],),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=> NoteEditor()));
        },
         label: Text("Add Note"),
        icon: Icon(Icons.add),),
    );
  }
}