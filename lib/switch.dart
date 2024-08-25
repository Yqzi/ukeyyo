import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ukeyyo/button.dart';

class UkeyyoSwitch extends StatefulWidget {
  const UkeyyoSwitch({super.key});

  @override
  State<UkeyyoSwitch> createState() => _UkeyyoSwitchState();
}

class _UkeyyoSwitchState extends State<UkeyyoSwitch> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        setState(() {
          light = !light;
        });
      },
      child: Row(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: FittedBox(
              child: CupertinoSwitch(
                value: light,
                activeColor: Colors.black,
                onChanged: (bool value) {
                  setState(() {
                    light = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Airplane Mode',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class UkkeyoFormSwtich extends StatefulWidget {
  const UkkeyoFormSwtich({super.key});

  @override
  State<UkkeyoFormSwtich> createState() => _UkkeyoFormSwtichState();
}

class _UkkeyoFormSwtichState extends State<UkkeyoFormSwtich> {
  bool light = false;
  bool light2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email Notifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16.0),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFD3D3D3),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: MaterialButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              setState(() {
                light = !light;
              });
            },
            // Content Padding
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Marketing emails',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Receive emails about new products, features, and more.',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Color(0xFF818589),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: FittedBox(
                      child: CupertinoSwitch(
                        value: light,
                        activeColor: Colors.black,
                        onChanged: (bool value) {
                          setState(() {
                            light = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFD3D3D3),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: MaterialButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              setState(() {
                light2 = !light2;
              });
            },
            // Content Padding
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Marketing emails',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Receive emails about new products, features, and more.',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Color(0xFF818589),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: FittedBox(
                      child: CupertinoSwitch(
                        value: light2,
                        activeColor: Colors.black,
                        onChanged: (bool value) {
                          setState(() {
                            light2 = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          // Control the width of the button
          width: MediaQuery.of(context).size.width / 11,
          child: UkeyyoButton(
            'Submit',
            type: UkeyyoButtonType.primary,
            onTap: () {
              // Map Notifs = {
              //   'Marketing emails': light,
              //   'Security emails': light2,
              // };

              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     shape: RoundedRectangleBorder(
              //       side: const BorderSide(
              //         color: Color(0xFF818589),
              //       ),
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //     backgroundColor: Colors.white,
              //     behavior: SnackBarBehavior.floating,
              //     width: MediaQuery.of(context).size.width / 4,
              //     content: Column(
              //       children: [
              //         const Text("You have submitted the following values:"),
              //         Container(
              //           color: const Color(0xFF36454F),
              //           child: Text(Notifs.),
              //         ),
              //       ],
              //     ),
              //   ),
              // );
            },
          ),
        ),
      ],
    );
  }
}
