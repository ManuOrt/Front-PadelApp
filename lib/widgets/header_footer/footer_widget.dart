import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/home/home_screen.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.07,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          const VerticalDivider(color: AppColors.primaryWhite, width: 1),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          const VerticalDivider(color: AppColors.primaryWhite, width: 1),
          IconButton(
            icon: const Icon(
              Icons.calendar_month,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          const VerticalDivider(color: AppColors.primaryWhite, width: 1),
          IconButton(
            icon: const Icon(
              Icons.chat,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}