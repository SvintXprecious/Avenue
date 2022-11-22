import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';


class SlidableCheckoutButton extends StatefulWidget {
  const SlidableCheckoutButton({Key? key, this.onSubmitt}) : super(key: key);


  @override
  State<SlidableCheckoutButton> createState() => _SlidableCheckoutButtonState();
  final void Function()? onSubmitt;
}

class _SlidableCheckoutButtonState extends State<SlidableCheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return SlideAction(


    );
  }
}
