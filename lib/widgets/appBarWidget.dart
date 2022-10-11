import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final String? title;
  final double? height;
  final bool? hideBack;
  final Widget? child;
  final VoidCallback onTap;

  AppBarWidget({
    Key? key,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.icon,
    this.title,
    this.height: kToolbarHeight,
    this.hideBack = false,
    this.child,
    required this.onTap
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: hideBack!
          ? const SizedBox()
          : InkWell(
              onTap: onTap,
              child: Icon(
                icon!,
                color: Colors.black,
                size: 16,
              ),
            ),
      title: Text(
        title!,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      actions: [child!],
    );
  }
}
