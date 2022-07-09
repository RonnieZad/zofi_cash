import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zofi_cash/constants/constants.dart';

class KeyPadButton extends StatefulWidget {
  const KeyPadButton({Key? key, required this.index, required this.tapAction})
      : super(key: key);
  final int index;
  final VoidCallback tapAction;

  @override
  State<KeyPadButton> createState() => _KeyPadButtonState();
}

class _KeyPadButtonState extends State<KeyPadButton> {
  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onPressed: widget.tapAction,
      child: Container(
        width: 70.w,
        height: 70.w,
        color: Colors.transparent,
        child: Center(
          child: Text(
              widget.index == 9
                  ? '.'
                  : widget.index == 10
                      ? '0'
                      : widget.index == 11
                          ? '<'
                          : '${widget.index + 1}',
              style: amountInputButtonTextStyle),
        ),
      ),
    );
  }
}
