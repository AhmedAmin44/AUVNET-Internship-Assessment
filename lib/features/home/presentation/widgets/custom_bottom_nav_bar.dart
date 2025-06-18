import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff8900FE),
          unselectedItemColor: Color(0xff484C52),
          items: [
            BottomNavigationBarItem(icon: Image.asset('assets/images/home.png'), label: 'Home'),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/categories.png'),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/deliver.png'),
              label: 'Deliver',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/cart.png'),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/profile.png'),
              label: 'Profile',
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: _getIndicatorPosition(
            currentIndex,
            MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width / 7,
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xff8900FE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _getIndicatorPosition(int index, double totalWidth) {
    final itemWidth = totalWidth / 5;
    return itemWidth * index;
  }
}
