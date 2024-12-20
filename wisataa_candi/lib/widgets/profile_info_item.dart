import 'package:flutter/material.dart';

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showEditions;
  final VoidCallback? onEditPressed;
  final Color iconColor;

  const ProfileInfoItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.value,
      this.showEditions = false,
      this.onEditPressed,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
