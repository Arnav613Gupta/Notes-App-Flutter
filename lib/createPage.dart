import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_stack_notes_app_flutter/urls.dart';
import 'package:http/http.dart';

class createPage extends StatefulWidget {
  const createPage({super.key,
  required this.client});
  final Client client;
  @override
  State<createPage> createState() => _createPageState();
}

class _createPageState extends State<createPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Add New Note"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              maxLines: 10,
              controller: controller,
            ),
            ElevatedButton(onPressed: () {
                widget.client.post(postNotesUrl(),body: {"body":controller.text});
              Navigator.pop(context);
            }, child: Text("Add")),
          ],
        ),
      ),
    );
  }
}
