import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_stack_notes_app_flutter/urls.dart';
import 'package:http/http.dart';

class updatePage extends StatefulWidget {



  const updatePage({super.key,
  required this.client, required this.note, required this.id});

  final Client client;
  final String note;
  final int id;

  @override
  State<updatePage> createState() => _updatePageState();
}

class _updatePageState extends State<updatePage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.text=widget.note.toString();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Update Note"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              maxLines: 10,
              controller: controller,
            ),
            ElevatedButton(onPressed: () {
              widget.client.put(updateNotesUrl(widget.id),body: {"body":controller.text});
              Navigator.pop(context);
            }, child: Text("Update")),
          ],
        ),
      ),


    );
  }
}
