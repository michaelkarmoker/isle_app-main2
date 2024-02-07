import 'package:flutter/material.dart';

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomTabBar(),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _switchToNextTab() {
    // Switch to the next tab programmatically
    int nextIndex = (_tabController.index + 1) % _tabController.length;
    _tabController.animateTo(nextIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Tab Bar'),
        bottom: TabBar(
          isScrollable: false,
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
          // Disable tab switching on tap
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(), // Disable tab switching
        children: [
          // Tab 1 content
          Center(
            child: ElevatedButton(
              onPressed: () => _switchToNextTab(),
              child: Text('Go to Tab 2'),
            ),
          ),
          // Tab 2 content
          Center(child: Text('Tab 2 content')),
          // Tab 3 content
          Center(child: Text('Tab 3 content')),
        ],
      ),
    );
  }
}
