import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/constant/colors.dart';
import 'package:flutter_delivery/common/layout/default_layout.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: C_PRIMARY,
        unselectedItemColor: C_BODY_TEXT,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        onTap: (value) {
          controller.animateTo(value);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood_outlined,
            ),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt_long_outlined,
            ),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            label: '프로필',
          ),
        ],
      ),
      child: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Center(child: Text('홈')),
          Center(child: Text('음식')),
          Center(child: Text('주문')),
          Center(child: Text('프로필'))
        ],
      ),
    );
  }
}
