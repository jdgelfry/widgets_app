import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Buttons',
    subtitle: 'Various types of buttons',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Card',
    subtitle: 'this is a card',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'ProgressIndicators',
    subtitle: 'General and controller',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbar and Dialog',
    subtitle: 'indicator in screen',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subtitle: 'Stateful widget animated',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: 'UI Controls',
    subtitle: 'One series of controls',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Tutorial',
    subtitle: 'little tutorial to app',
    link: '/tutorial',
    icon: Icons.accessibility_new_rounded,
  ),
];
