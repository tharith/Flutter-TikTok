import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStarScreen extends StatefulWidget {
  const RatingStarScreen({super.key});

  @override
  State<RatingStarScreen> createState() => _RatingStarScreenState();
}

class _RatingStarScreenState extends State<RatingStarScreen> {
  late final _ratingController;
  late double _rating;
  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initailRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;
  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initailRating;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)
        )
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Rating Star"),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                color: Colors.white,
                onPressed: () async {
                  _selectedIcon = await showDialog<IconData>(
                    context: context,
                    builder: (context) => const IconAlert()
                  );
                  _ratingBarMode = 1;
                  setState(() {

                  });
                },
              )
            ],
          ),
          body: Directionality(
            textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40.0,),
                  _heading("Rating Bar"),
                  _ratingBar(_ratingBarMode),
                  const SizedBox(height: 20.0,),
                  Text(
                    "Rating: $_rating",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  const SizedBox(height: 40.0,),
                  _heading("Rating Indicator"),
                  RatingBarIndicator(
                    rating: _userRating,
                    itemBuilder: (context, index) => Icon(
                      _selectedIcon ?? Icons.star,
                      color: Colors.red,
                    ),
                    itemCount: 5,
                    itemSize: 50.0,
                    unratedColor: Colors.amber.withAlpha(50),
                    direction: _isVertical ? Axis.vertical : Axis.horizontal,
                  ),
                  const SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: _ratingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Enter rating",
                        labelText: "Enter rating",
                        suffixIcon: MaterialButton(
                          onPressed: () {
                            _userRating = double.parse(_ratingController.text ?? "0.0");
                            setState(() {

                            });
                          },
                          child: const Text("Rate"),
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // create wegid Image
  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.red,
    );
  }

  // create widget heading
  Widget _heading(String text) => Column(
    children: [
      Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 24.0
        ),
      )
    ],
  );

  Widget _ratingBar(int mode) {
    switch (mode) {
      case 1:
        return RatingBar.builder(
          initialRating: _initailRating,
          minRating: 1,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 50.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            _selectedIcon ?? Icons.start,
            color: Colors.red,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 2:
        return RatingBar(
          initialRating: _initailRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: _image("assets/heart.png"),
            half: _image("assets/heart_half.png"),
            empty: _image("assets/heart_border.png")
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 3:
        return RatingBar.builder(
          initialRating: _initailRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return const Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return const Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return const Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return Container();
            }
          },
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      default:
        return Container();
    }
  }
}

class IconAlert extends StatelessWidget {
  const IconAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Select Icon",
        style: TextStyle(
          fontWeight: FontWeight.w400
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      titlePadding: const EdgeInsets.all(12.0),
      contentPadding: const EdgeInsets.all(0),
      content: Wrap(
        children: [
          _iconButton(context, Icons.home),
          _iconButton(context, Icons.airplanemode_active),
          _iconButton(context, Icons.euro_symbol),
          _iconButton(context, Icons.beach_access),
          _iconButton(context, Icons.attach_money),
          _iconButton(context, Icons.music_note),
          _iconButton(context, Icons.android),
          _iconButton(context, Icons.toys),
          _iconButton(context, Icons.language),
          _iconButton(context, Icons.landscape),
          _iconButton(context, Icons.ac_unit),
          _iconButton(context, Icons.star),
          _iconButton(context, Icons.access_time_sharp),
          _iconButton(context, Icons.abc_sharp),
          _iconButton(context, Icons.star_border_purple500_sharp)
        ],
      ),
    );
  }

  // create widget
  Widget _iconButton(BuildContext context, IconData icon) => IconButton(
    icon: Icon(icon),
    onPressed: () => Navigator.pop(context, icon),
    splashColor: Colors.amberAccent,
    color: Colors.redAccent,
  );
}


