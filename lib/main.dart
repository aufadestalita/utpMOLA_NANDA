import 'package:flutter/material.dart';

void main() {
  runApp(const ThreadsCloneApp());
}

class ThreadsCloneApp extends StatelessWidget {
  const ThreadsCloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Threads Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

// BOTTOM NAVIGATION BAR BUAT (4 TAMPILAN UTAMA)

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    ActivityPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
            activeIcon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            activeIcon: Icon(Icons.search, size: 30, shadows: [Shadow(color: Colors.black, blurRadius: 1)]),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 30),
            activeIcon: Icon(Icons.favorite, size: 30),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 30),
            activeIcon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


// 1. INI BUAT TAMPILAN HOME NYA (Beranda)

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Icon @ sebagai pengganti logo Threads
        title: const Icon(Icons.alternate_email, size: 32, color: Colors.black),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildThreadPost('agil', '2h', 'dapet ga dapet, harus dapet!', '12.5K', '890'),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          _buildThreadPost('astia', '4h', 'congratulaion yah .', '45K', '2.1K', hasImage: true),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          _buildThreadPost('hasna', '5h', 'thanks new romance!', '8.2K', '412'),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          _buildThreadPost('ufa', '8h', 'bandung, braga, malam itu?', '3.1K', '156'),
        ],
      ),
    );
  }

  Widget _buildThreadPost(String username, String time, String content, String likes, String replies, {bool hasImage = false}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Column(
            children: [
             const CircleAvatar(
              radius: 20, // atau 35 di halaman Profile
              backgroundImage: AssetImage('assets/images/foto1.jpg'), // Sesuaikan nama file fotomu!
            ),
              const SizedBox(height: 8),
              Container(width: 2, height: hasImage ? 180 : 80, color: Colors.grey[300]), // Garis vertikal khas Threads
            ],
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(username, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Row(
                      children: [
                        Text(time, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                        const SizedBox(width: 12),
                        const Icon(Icons.more_horiz, color: Colors.grey, size: 20),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(content, style: const TextStyle(fontSize: 15, height: 1.3)),
                if (hasImage) ...[
                const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/foto2.jpg', // Sesuaikan nama file fotomu!
                      height: 250,
                      width: double.infinity,
                     fit: BoxFit.contain,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Icon(Icons.favorite_border, size: 22),
                    SizedBox(width: 16),
                    Icon(Icons.chat_bubble_outline, size: 22),
                    SizedBox(width: 16),
                    Icon(Icons.repeat, size: 22),
                    SizedBox(width: 16),
                    Icon(Icons.send_outlined, size: 22),
                  ],
                ),
                const SizedBox(height: 12),
                Text('$replies replies · $likes likes', style: const TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// 2. BUAT TAMPILAN SEARCH NY (Pencarian)

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text('Search', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildSearchItem('zuck', 'Mark Zuckerberg', '12.5M followers'),
                  _buildSearchItem('instagram', 'Instagram', '40.2M followers'),
                  _buildSearchItem('netflix', 'Netflix', '5.1M followers'),
                  _buildSearchItem('spotify', 'Spotify', '2.8M followers'),
                  _buildSearchItem('mkbhd', 'Marques Brownlee', '1.9M followers'),
                  _buildSearchItem('9gag', '9GAG', '6.5M followers'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchItem(String username, String name, String followers) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey, // EDIT FOTO DI SINI
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Row(
            children: [
              Text(username, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(width: 4),
              const Icon(Icons.verified, color: Colors.blue, size: 14),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              const SizedBox(height: 4),
              Text(followers, style: const TextStyle(color: Colors.black, fontSize: 14)),
            ],
          ),
          trailing: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: BorderSide(color: Colors.grey[300]!, width: 1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            onPressed: () {},
            child: const Text('Follow', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 76.0),
          child: Divider(height: 1, color: Color(0xFFEEEEEE)),
        ),
      ],
    );
  }
}


// 3. INI BUAT TAMPILAN ACTIVITY NY (Notifikasi)

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text('Activity', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildChip('All', isSelected: true),
                  _buildChip('Follows'),
                  _buildChip('Conversations'),
                  _buildChip('Mentions'),
                  _buildChip('People you follow'),
                  _buildChip('Reposts'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildActivityItem('hasna', 'Followed you', '2h', isFollow: true),
                  _buildActivityItem('Nanda', 'Mentioned you in a thread', '4h', content: '"Great job on the UI clone @nandaagustina!"'),
                  _buildActivityItem('Darmanto', 'Replied to your thread', '5h', content: '"Boleh minta source code-nya ngga?"'),
                  _buildActivityItem('fitria', 'Followed you', '1d', isFollow: true),
                  _buildActivityItem('anggun', 'Followed you', '2d', isFollow: true),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isSelected ? Colors.black : Colors.grey[300]!),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildActivityItem(String username, String action, String time, {String? content, bool isFollow = false}) {
    return Column(
      children: [
        ListTile(
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey, // EDIT FOTO DI SINI
                child: Icon(Icons.person, color: Colors.white),
              ),
              Positioned(
                bottom: 0, right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isFollow ? Colors.purple : Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFollow ? Icons.person_add : Icons.reply,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
          title: Row(
            children: [
              Text(username, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(width: 8),
              Text(time, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(action, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              if (content != null) ...[
                const SizedBox(height: 4),
                Text(content, style: const TextStyle(color: Colors.black, fontSize: 14)),
              ]
            ],
          ),
          trailing: isFollow
              ? OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey[300]!, width: 1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Text('Follow', style: TextStyle(fontWeight: FontWeight.bold)),
                )
              : null,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 76.0),
          child: Divider(height: 1, color: Color(0xFFEEEEEE)),
        ),
      ],
    );
  }
}


// 4. INI BUAT TAMPILAN PROFILE  NY

                class ProfilePage extends StatelessWidget {
                  const ProfilePage({Key? key}) : super(key: key);

                  @override
                  Widget build(BuildContext context) {
                    return DefaultTabController(
                      length: 3,
                      child: Scaffold(
                        appBar: AppBar(
                        
                          actions: [
                            IconButton(
                              icon: const Icon(Icons.camera_alt_outlined, color: Colors.black), // ganti ke FontAwesomeIcons.instagram jika ada package font_awesome
                              onPressed: () {},
                            ),

                            // 2. Icon Search (Tambahan Baru)
                            IconButton(
                              icon: const Icon(Icons.search, color: Colors.black),
                              onPressed: () {},
                            ),

                            // 3. Icon Pengaturan / Gerigi (Pengganti Icons.menu garis tiga)
                            IconButton(
                              icon: const Icon(Icons.settings_outlined, color: Colors.black),
                              onPressed: () {},
                            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // DATA DIRI (Nama & Username)
                          const Text('Nanda Agustina', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
                            child: const Text('@Nanda Agustina', style: TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 35,
                       backgroundImage: AssetImage('assets/images/foto1.jpg'), // EDIT FOTO NYA DI SINI
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('D3 Manajemen Informatika | Unila\nTech enthusiast ', style: TextStyle(fontSize: 15)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      // Tumpukan avatar kecil khas Threads
                      Stack(
                        children: [
                          const CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                              child: const CircleAvatar(radius: 10, backgroundColor: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      const Text('120 followers', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Tombol Edit Profile & Share
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: BorderSide(color: Colors.grey[300]!, width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {},
                          child: const Text('Edit profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: BorderSide(color: Colors.grey[300]!, width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {},
                          child: const Text('Share profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorWeight: 1,
              tabs: [
                Tab(text: 'Threads'),
                Tab(text: 'Replies'),
                Tab(text: 'Media'),
                Tab(text: 'Reposts'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("You haven't posted any threads yet.", style: TextStyle(color: Colors.grey))),
                  Center(child: Text("No replies yet.", style: TextStyle(color: Colors.grey))),
                  Center(child: Text("No Media yet.", style: TextStyle(color: Colors.grey))),
                  Center(child: Text("No reposts yet.", style: TextStyle(color: Colors.grey))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}