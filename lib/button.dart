import 'package:flutter/material.dart';

const Color primaryButtonColor = Color(0xFF000000);
const Color primaryAccentColor = Color(0xFFCAD8F3);
const Color secondaryButtonColor = Color.fromRGBO(244, 244, 255, 1);
const Color disabledButtonColor = Color(0xFFA6A6A6);
const Color destructiveColor = Colors.red;

const buttonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 15,
);

enum UkeyyoButtonType { primary, secondary, link, outline, disabled, ghost }

enum JoButtonPadding {
  primary(14),
  thin(2);

  const JoButtonPadding(this.pad);

  final double pad;
}

extension on UkeyyoButtonType {
  Color get color {
    switch (this) {
      case UkeyyoButtonType.primary:
        return primaryButtonColor;
      case UkeyyoButtonType.secondary:
        return secondaryButtonColor;
      case UkeyyoButtonType.ghost:
        return Colors.transparent;
      case UkeyyoButtonType.disabled:
        return disabledButtonColor;
      case UkeyyoButtonType.outline:
        return Colors.transparent;
      case UkeyyoButtonType.link:
        return Colors.transparent;
    }
  }

  BoxBorder? get border {
    switch (this) {
      case UkeyyoButtonType.outline:
        return Border.all(color: secondaryButtonColor);

      default:
        return null;
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case UkeyyoButtonType.link:
        return buttonTextStyle.copyWith(color: primaryButtonColor);
      case UkeyyoButtonType.outline:
        return buttonTextStyle.copyWith(
          color: primaryButtonColor,
        );
      case UkeyyoButtonType.secondary:
        return buttonTextStyle.copyWith(color: primaryButtonColor);
      case UkeyyoButtonType.ghost:
        return buttonTextStyle.copyWith(color: primaryButtonColor);

      default:
        return buttonTextStyle;
    }
  }
}

// Default Button

// Main Button
class UkeyyoButton extends StatelessWidget {
  final String text;
  final UkeyyoButtonType type;
  final JoButtonPadding padding;
  final IconData? leadingIcon;
  final void Function() onTap;

  final bool _isLoading;

  const UkeyyoButton(
    this.text, {
    super.key,
    required this.type,
    this.leadingIcon,
    this.padding = JoButtonPadding.primary,
    required this.onTap,
  }) : _isLoading = false;

  const UkeyyoButton._loading(
    this.text, {
    required this.type,
    this.leadingIcon,
    this.padding = JoButtonPadding.primary,
    required this.onTap,
  }) : _isLoading = true;

  @override
  Widget build(BuildContext context) {
    late bool showBorder = false;
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      clipBehavior: Clip.antiAlias,
      color: type.color,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: type.border,
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
        child: InkWell(
          hoverColor: type == UkeyyoButtonType.link ? Colors.transparent : null,
          onHover: type == UkeyyoButtonType.link
              ? (val) {
                  showBorder = val;
                }
              : null,
          onTap:
              (type == UkeyyoButtonType.disabled || _isLoading) ? null : onTap,
          child: type == UkeyyoButtonType.link
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: showBorder
                              ? const Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                  ),
                                )
                              : null,
                        ),
                        child: Text(
                          text,
                          style: type.textStyle,
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _isLoading
                        ? [
                            SizedBox.square(
                              dimension: 12,
                              child: CircularProgressIndicator(
                                color: type.textStyle.color,
                                strokeWidth: 2,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Please wait',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]
                        : [
                            if (leadingIcon != null) ...[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                child: Icon(
                                  leadingIcon,
                                  size: 20,
                                  color: primaryButtonColor,
                                ),
                              ),
                              if (text != "") const SizedBox(width: 5),
                            ],
                            if (text != "")
                              Text(
                                text,
                                style: type.textStyle,
                              ),
                          ],
                  ),
                ),
        ),
      ),
    );
  }
}

// Stylized Buttons

// Loading Button
class UkeyyoButtonAsync extends StatefulWidget {
  final String text;
  final UkeyyoButtonType type;
  final JoButtonPadding padding;
  final IconData? leadingIcon;
  final Future<void> Function() onTap;
  const UkeyyoButtonAsync(
    this.text, {
    super.key,
    required this.type,
    this.leadingIcon,
    this.padding = JoButtonPadding.primary,
    required this.onTap,
  });

  @override
  State<UkeyyoButtonAsync> createState() => _UkeyyoButtonAsyncState();
}

class _UkeyyoButtonAsyncState extends State<UkeyyoButtonAsync> {
  bool isLoading = false;

  Future<void> onTap() async {
    setState(() => isLoading = true);
    await widget.onTap();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? UkeyyoButton._loading(
            widget.text,
            type: UkeyyoButtonType.disabled,
            leadingIcon: widget.leadingIcon,
            padding: widget.padding,
            onTap: onTap,
          )
        : UkeyyoButton(
            widget.text,
            type: widget.type,
            leadingIcon: widget.leadingIcon,
            padding: widget.padding,
            onTap: onTap,
          );
  }
}

class UkeyyoButtonLink extends StatefulWidget {
  final void Function() onTap;
  final String text;
  const UkeyyoButtonLink({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<UkeyyoButtonLink> createState() => _UkeyyoButtonLinkState();
}

class _UkeyyoButtonLinkState extends State<UkeyyoButtonLink> {
  UkeyyoButtonType type = UkeyyoButtonType.link;
  bool showBorder = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      clipBehavior: Clip.antiAlias,
      color: type.color,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: type.border,
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
        child: InkWell(
          hoverColor: Colors.transparent,
          onHover: (val) {
            setState(() {
              showBorder = val;
            });
          },
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: showBorder == true
                        ? const Border(
                            bottom: BorderSide(
                              width: 1.0,
                            ),
                          )
                        : null,
                  ),
                  child: Text(
                    widget.text,
                    style: type.textStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
