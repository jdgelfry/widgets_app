import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen'; //name is used in app_router.dart
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buttons'),
        ),
        body: const _ButtonsView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).pop(); //this equivalent to the GoRouter back button
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ));
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            // ------- first button -------
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            // ------- second button -------
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disabled'),
            ),
            // ------- third button -------
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon'),
            ),
            // ------- fourth button -------
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            // ------- fifth button -------
            FilledButton.icon(
              label: const Text('Filled Icon'),
              onPressed: () {},
              icon: const Icon(Icons.accessibility_new),
            ),
            // ------- sixth button -------
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            // ------- seventh button -------
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.terminal),
              label: const Text('Outlined Icon'),
            ),
            // ------- eighth button -------
            TextButton(onPressed: () {}, child: const Text('Text')),
            // ------- ninth button -------
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_box_outlined),
              label: const Text('Text Icon'),
            ),
            // ------- tenth button -------
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded)),
            // ------- eleventh button -------
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: const WidgetStatePropertyAll(Colors.white),
              ),
            ),
            // ------- custom button -------

            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

// Custom button widget
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      //ClipRRect is used to clip the button to a rounded rectangle
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Custom Button",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
