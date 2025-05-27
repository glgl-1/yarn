import 'package:flutter/material.dart';
import 'package:yarn/vm/mybottomtapbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List projects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          projects.isEmpty
              ? Center(
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.info_outline, size: 48, color: Colors.blue),
                        SizedBox(height: 16),
                        Text('진행중인 작업이 없습니다', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              )
              : ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  // 프로젝트 카드 리스트 구현
                  return Container(); // 예시
                },
              ),
      bottomNavigationBar: MyBottomTapBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  _onTabTapped(int index){
    _selectedIndex = index;
    //
  }
}// END
