import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

GlobalKey<_RatingWidgetState> ratingOnRecorder =  GlobalKey<_RatingWidgetState>();
class RatingWidget extends StatefulWidget {
  final double start;
  final ValueChanged onChanged;
  const RatingWidget({Key key, this.start, this.onChanged}) : super(key: key);
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: widget.start,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        widget.onChanged(
          rating
        );
        print(rating);
      },
    );
  }
}
