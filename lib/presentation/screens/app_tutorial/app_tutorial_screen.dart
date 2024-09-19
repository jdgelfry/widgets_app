import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Search to food',
    caption:
        'While eating at a restaurant is an enjoyable and convenient occasional treat, most individuals and families prepare their meals at home. To make breakfast, lunch, and dinner daily, these persons must have the required foods and ingredients on hand and ready to go; foods and ingredients are typically purchased from a grocery store, or an establishment that distributes foods, drinks, household products, and other items that are used by the typical consumer.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'delivery speed',
    caption:
        'Produce, or the term used to describe fresh fruits and vegetables, is commonly purchased by grocery store shoppers. In terms of fruit, most grocery stores offer bananas, apples, oranges, blackberries, raspberries, grapes, pineapples, cantaloupes, watermelons, and more; other grocery stores with larger produce selections might offer the listed fruits in addition to less common fruits, including mangoes, honeydews, starfruit, coconuts, and more.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Like the food',
    caption:
        'Depending on the grocery store, customers can purchase fruits in a few different ways. Some stores will charge a set amount per pound of fruit, and will weigh customers fruit purchases and bill them accordingly; other stores will charge customers for each piece of fruit they buy, or for bundles of fruit (a bag of bananas, a bag of apples, etc.) other stores yet will simply charge by the container.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool endReached = false;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => _Slide(
                      title: slide.title,
                      caption: slide.caption,
                      imageUrl: slide.imageUrl,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
                onPressed: () => context.pop(), child: const Text('Skip')),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Init'),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl),
              const SizedBox(height: 20),
              Text(
                title,
                style: titleStyle,
              ),
              const SizedBox(height: 10),
              Text(
                caption,
                textAlign: TextAlign.justify,
                style: captionStyle,
              ),
            ],
          ),
        ));
  }
}
