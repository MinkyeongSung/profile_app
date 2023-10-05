import 'package:flutter/material.dart';

// Stateful 위젯은 build 메서드가 여러번 실행 될 수 있다.
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin => Composition코드
  TabController? _tabController;

  @override // 최초에 한번만 실행되는 메소드 (오브젝트 초기화 메소드)
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    print("initState()  초기화됨");
  }

  @override
  Widget build(BuildContext context) {
    print("빌드 다시 됨");
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              icon: Icon(Icons.directions_transit),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) =>
                    Image.network("https://picsum.photos/id/${index}/200/300"),
              ),
              Container(color: Colors.green),
            ],
          ),
        )
      ],
    );
  }
}
