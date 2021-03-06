import 'package:cinema_flt/components/widgets/placeholder/similiar_item_placeholder.dart';
import 'package:cinema_flt/models/similar_result.dart';
import 'package:flutter/material.dart';

import 'similiar_movie_item.dart';

class SimiliarMovie extends StatelessWidget {
  SimilarResult _similiarMovie;

  SimiliarMovie(this._similiarMovie);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isPortrait ? 20 : 10,
      ),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(0.0),
        crossAxisSpacing: 5.0,
        scrollDirection: Axis.vertical,
        crossAxisCount: isPortrait ? 3 : 7,
        childAspectRatio: 0.6,
        shrinkWrap: true,
        children: getGridViewItem(),
      ),
    );
  }

  List<Widget> getGridViewItem() {
    if (_similiarMovie != null) {
      return _similiarMovie.results
          .map((item) => SimiliarMovieItem(item))
          .toList();
    } else {
      List<Widget> list = List<Widget>();
      for (var i = 0; i < 10; i++) {
        list.add(SimiliarItemPlaceholder());
      }
      return list;
    }
  }
}
