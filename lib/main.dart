import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CopMap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RoleSelectionScreen(),
    );
  }
}

// ... rest of code (RoleSelectionScreen, LoginPage, DashboardPage, navigateToLoginPage function)

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CopMap'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Select Your Role',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                navigateToLoginPage(context, 'Supervisor');
              },
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Supervisor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                navigateToLoginPage(context, 'Division');
              },
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Division',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                navigateToLoginPage(context, 'Station');
              },
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Station',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                navigateToLoginPage(context, 'Officer');
              },
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Officer',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final String role;

  const LoginPage({super.key, required this.role});

  void navigateToDashboard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardPage(role: role),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Code for Forgot Password
                  },
                  child: const Text('Forgot Password?'),
                ),
                TextButton(
                  onPressed: () {
                    // Code for Register
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                navigateToDashboard(context);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  final String role;

  const DashboardPage({super.key, required this.role});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.role),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text('Home Page'),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text('Bandobast Page'),
            ),
          ),
          Container(
            color: Colors.orange,
            child: const Center(
              child: Text('Create Page'),
            ),
          ),
          Container(
            color: Colors.red,
            child: const Center(
              child: Text('Manage Page'),
            ),
          ),
          Container(
            color: Colors.purple,
            child: const Center(
              child: Text('Profile Page'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Bandobast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_police),
            label: 'Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}

void navigateToLoginPage(BuildContext context, String role) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoginPage(role: role),
    ),
  );
}
