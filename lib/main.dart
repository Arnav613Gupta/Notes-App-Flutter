import 'package:flutter/material.dart';
import 'package:full_stack_notes_app_flutter/createPage.dart';
import 'package:full_stack_notes_app_flutter/note.dart';
import 'package:full_stack_notes_app_flutter/updatePage.dart';
import 'package:full_stack_notes_app_flutter/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var client = http.Client();
  List<Note> list = [];

  @override
  void initState() {
    _retriveNotes();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _retriveNotes();
          },
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(list[index].body.toString()),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>updatePage(client:client,

                    id: list[index].id!.toInt(),note:list[index].body.toString())));

                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      delete(list[index].id.toString());
                    },
                  ),
                );
              }),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>createPage(client:client)));

        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _retriveNotes() async {
    list = [];
    print('Number of books about http:');
    var url = getNotesUrl();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = convert.jsonDecode(response.body);
      // Convert each JSON object to a Note instance
      jsonResponse.forEach((element) {
        list.add(Note.fromJson(element));
      });

      print('Number of books about http: $list.');
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void delete(String pk) async {
    await client.delete(deleteNotesUrl(pk));
    _retriveNotes();
  }
}
