import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('This is a custom snackbar'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'x',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //use for not close dialog on tap outside
      builder: (context) {
        return AlertDialog(
          title: const Text('¿is sure?'),
          content: const Text(
              'Nam efficitur sapien at lorem venenatis, quis sollicitudin mauris malesuada. Mauris maximus tincidunt turpis vel mollis. Curabitur dictum fringilla enim sit amet pellentesque. Integer et posuere libero. Nunc eu ligula feugiat, vehicula arcu a, ornare nisi. Nullam eget tellus non quam vehicula pharetra. Pellentesque venenatis, leo at suscipit gravida, turpis est sollicitudin quam, id pretium libero arcu non sapien. Suspendisse nisl dui, sodales at eleifend sit amet, laoreet ut lorem.'),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Close'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Accept'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar and Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: const [
                  Text('This is a custom dialog'),
                ]);
              },
              child: const Text('Use license'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Show dialog'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
