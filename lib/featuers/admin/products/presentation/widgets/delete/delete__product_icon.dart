
import 'package:flutter/material.dart';

class DeleteProductIcon extends StatelessWidget {
  const DeleteProductIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.delete_rounded,
          color: Colors.red,
        ));
  }
}