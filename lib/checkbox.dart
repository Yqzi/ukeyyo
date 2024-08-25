import 'package:flutter/material.dart';

class UkeyyoCheckbox extends StatefulWidget {
  final String title;
  final TextStyle textStyle;
  final bool isDisabled;
  const UkeyyoCheckbox({
    super.key,
    this.textStyle = const TextStyle(),
    this.isDisabled = false,
    required this.title,
  });

  @override
  State<UkeyyoCheckbox> createState() => _UkeyyoCheckboxState();
}

class _UkeyyoCheckboxState extends State<UkeyyoCheckbox> {
  bool? isChecked = true;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.isDisabled ? false : isChecked,
      activeColor: Colors.black,
      visualDensity: const VisualDensity(horizontal: -3, vertical: -4),
      title: Text(
        widget.title,
        style: widget.textStyle,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: !widget.isDisabled
          ? (bool? value) {
              setState(() {
                isChecked = value;
              });
            }
          : null,
    );
  }
}
