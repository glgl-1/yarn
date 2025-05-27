import 'package:flutter/material.dart';

class MyBottomTapBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MyBottomTapBar({Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  State<MyBottomTapBar> createState() => _MyBottomTapBarState();
}

class _MyBottomTapBarState extends State<MyBottomTapBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          label: '프로젝트',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          label: '재고',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: '캘린더',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: '도안',
        ),
      ],
    );
  }
}
