import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); 
  }

  
  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _tabController.animateTo(index); 
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Page'),
        bottom: TabBar(
          controller: _tabController,
          onTap: _onTabChanged,
          tabs: const [
            Tab(text: 'Home'),
            Tab(text: 'Product'),
            Tab(text: 'Contact'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _buildDrawerItem(Icons.home, 'Home', 0),
            _buildDrawerItem(Icons.shopping_cart, 'Product', 1),
            _buildDrawerItem(Icons.phone, 'Contact', 2),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Welcome to Home')),  
          Center(child: Text('Explore Products')), 
          Center(child: Text('Contact Us')),       
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabChanged,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Contact',
          ),
        ],
      ),
    );
  }

  
  ListTile _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); 
        _onTabChanged(index);
      },
    );
  }
}
