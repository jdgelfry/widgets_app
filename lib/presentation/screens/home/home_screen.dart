import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen'; //name is used in app_router.dart

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    appMenuItems[0].title;
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: appMenuItems
            .length, // for the number of items and not view errors the length of the list is used
        itemBuilder: (context, index) {
          final item = appMenuItems[index];
          return _CustomListTile(item: item);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      leading: Icon(item.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );
        // context.pushNamed(CardsScreen.name); //use for static routes
        context.push(item.link);
      },
    );
  }
}
