import 'package:flutter/material.dart';

class FavoriteStarButton extends StatefulWidget {
  @override
  _FavoriteStarButtonState createState() => _FavoriteStarButtonState();
}

class _FavoriteStarButtonState extends State<FavoriteStarButton> {
  bool isFavorite = false; // Initial favorite state is set to false

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        size: 40,
        isFavorite
            ? Icons.star
            : Icons.star_border, // Conditional icon based on isFavorite
        color: isFavorite
            ? Colors.yellow
            : Colors.black, // Change color when favorited
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite; // Toggle the state
        });
      },
    );
  }
}
