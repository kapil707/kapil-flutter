import 'package:flutter/material.dart';
import 'package:kapil11/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Kamal G"),
          ),
          body: Mylogin()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        child: Column(children: [
          Expanded(child: MyListView()),
          Expanded(child: MyListView()),
        ]));

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    //     Text("A"),
    //     Text("b"),
    //     Text("c"),
    //     Text("d"),
    //   ],
    // )

    // Column(
    //   children: [
    //     Text("A"),
    //     Text("b"),
    //     Text("c"),
    //     Text("d"),
    //   ],
    // )

    // Center(
    //     child: Container(
    //       width: 100,height: 100,
    //         child: Image.asset('assets/images/logo4.png')))

    // OutlinedButton(
    //   child: Text('Click me'),
    //   onPressed: (){
    //     print("hello g");
    //   },
    // ),

    // ElevatedButton(
    //   child: Text('Click me'),
    //   onPressed: (){
    //     print("hello g");
    //   },
    // ),

    // TextButton(
    //   child: Text('Click me'),
    //   onPressed: (){
    //     print("hello g");
    //   },
    // ),
    // Center(
    //   child: Container(
    //     width: 100,
    //     height: 100,
    //     color: Colors.amberAccent,
    //     child: Center(child: Text("kapil",style: TextStyle(
    //       fontSize: 25,
    //       color: Colors.black,
    //       backgroundColor: Colors.grey,
    //     ),),),
    //   ),
    // ),
  }
}

class MyListView extends StatelessWidget {
  // Dummy data for the list
  final List<String> items = List.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Wrap(children: [
          Column(children: [
            Container(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/logo4.png')),
            Text("hello"),
            Text("ram ram g"),
            Text("ram ram g")
          ])
        ]);
      },
    );
  }
}
