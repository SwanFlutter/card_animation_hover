This class is a StatefulWidget that displays a card with a hover animation effect.

## Features




![card_animation](https://github.com/user-attachments/assets/d7af5666-8472-4cfb-a8f3-d577f92cfbe1)

```dart
 body: SingleChildScrollView(
          child: Center(
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
                                  builder: (context) => const Screen()),
                            );
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        ),

  final List<Map<String, String>> cards = [
  for (int index = 0; index < imageUrls.length; index++) ...[
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
```

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
