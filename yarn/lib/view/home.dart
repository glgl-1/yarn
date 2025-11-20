import 'package:flutter/material.dart';
import 'package:yarn/view/myinventory.dart';
import 'package:yarn/view/myproject.dart';
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
    Widget page;
    switch (_selectedIndex) {
      case 0: // 메인화면
        page =
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
                          Icon(
                            Icons.info_outline,
                            size: 48,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 16),
                          Text(
                            '진행중인 작업이 없습니다', 
                            style: TextStyle(fontSize: 18),
                            ),
                        ],
                      ),
                    ),
                  ),
                )
                : ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return Container(); // 실제 프로젝트 카드 구현
                  },
                );
        break;
      case 1: // 프로젝트
        page = Myproject();
        break;
      case 2: // 재고
        page = Myinventory();
        break;
      case 3: // 캘린더
        page = Center(child: Text('캘린더')); // 임시
        break;
      case 4: // 도안
        page = Center(child: Text('도안')); // 임시
        break;
      default:
        page = Center(child: Text('미구현'));
    }

    return Scaffold(
      body: page,
      bottomNavigationBar: MyBottomTapBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  // --- functions ---

  _onTabTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }
} // END
