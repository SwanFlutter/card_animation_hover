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
      'image': imageUrls[index], /// required image
      'header': 'Canyons', /// required header
      'content': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', /// required content
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

```yaml
dependencies:
  card_animation_hover: ^0.0.1
```



## Usage

```dart
import 'package:card_animation_hover/card_animation_hover.dart';

```



## Additional information

If you have any issues, questions, or suggestions related to this package, please feel free to contact us at [swan.dev1993@gmail.com](mailto:swan.dev1993@gmail.com). We welcome your feedback and will do our best to address any problems or provide assistance.
For more information about this package, you can also visit our [GitHub repository](https://github.com/SwanFlutter/card_animation_hover) where you can find additional resources, contribute to the package's development, and file issues or bug reports. We appreciate your contributions and feedback, and we aim to make this package as useful as possible for our users.
Thank you for using our package, and we look forward to hearing from you!
