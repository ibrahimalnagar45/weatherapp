import 'package:flutter/widgets.dart';

class NOWeatherInfo extends StatelessWidget {
  const NOWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  const  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children:   [
            Text(
            "there is no weather 😞 start",
            style: TextStyle(fontSize: 28),
          ),
            Text(
            "searching now 🔍",
            style: TextStyle(fontSize: 28),
          )
        ],
      ),
    );
  }
}
