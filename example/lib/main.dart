import 'package:card_animation_hover/card_animation_hover.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Wrap(
            spacing: 20.0,
            runSpacing: 22.0,
            children: cards
                .map((card) => CardAnimationHover(
                      card: card,
                      showAnimation: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()),
                        );
                      },
                    ))
                .toList(),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

final List<Map<String, String>> cards = [
  for (var index = 0; index < imageUrls.length; index++) ...[
    {
      'image': imageUrls[index],
      'header': 'Canyons',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.',
    },
    {
      'image': imageUrls[index],
      'header': 'Beaches',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.',
    },
    {
      'image': imageUrls[index],
      'header': 'Trees',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.',
    },
  ]
];

const List<String> imageUrls = <String>[];
