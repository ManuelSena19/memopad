import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memopad/style/app_style.dart';
import 'package:intl/intl.dart';

import '../style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int colorId = Random().nextInt(AppStyle.cardsColor.length);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();
  final DateTime _now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat('yyyy-MM-dd HH:mm').format(_now);
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
            "Add a note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 8,),
            Text(date, style: AppStyle.dateTitle,),
            const SizedBox(height: 28,),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Content"
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async{
          FirebaseFirestore.instance.collection("notes").add({
            "note_title": _titleController.text,
            "creation_date": date,
            "note_content": _mainController.text,
            "color_id": colorId
          }).then((value){
            Navigator.pop(context);
          }).catchError((error) => print("Text could not be saved due to $error"));
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
