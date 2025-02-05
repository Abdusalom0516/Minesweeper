import 'package:flutter/material.dart';
import 'package:mine_game/core/constants/colors.dart';
import 'package:mine_game/core/utils/short_responsiveness.dart';

class SurfaceMaker extends StatelessWidget {
  final int id;
  final List<int> list;
  final bool isPressed;
  final VoidCallback onPressed;

  const SurfaceMaker({
    super.key,
    required this.id,
    required this.list,
    required this.isPressed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: isPressed ? null : onPressed,
      child: isPressed
          ? list.contains(id)
              ? Image.asset(
                  "assets/images/mine.png",
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  "assets/images/diamond.png",
                  fit: BoxFit.contain,
                )
          : Container(
              decoration: BoxDecoration(
                color: AppColors.dark,
                border: Border(
                  top: BorderSide(color: AppColors.dark, width: appW(3)),
                  left: BorderSide(color: AppColors.dark, width: appW(3)),
                  right: BorderSide(
                      color: Colors.black.withValues(alpha: 0.5),
                      width: appW(4)),
                  bottom: BorderSide(
                      color: Colors.black.withValues(alpha: 0.5),
                      width: appW(4)),
                ),
              ),
            ),
    );
  }
}
