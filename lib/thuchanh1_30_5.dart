import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 5),
            // Sửa lỗi bằng cách loại bỏ onBackgroundImageError
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.grey[300],
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Hiển thị icon mặc định khi không tải được hình
                    return Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey[600],
                    );
                  },
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Jacket Compose',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Jacket Compose là một nhà phát triển ứng dụng di động với hơn 5 năm kinh nghiệm trong việc phát triển ứng dụng Android và iOS. Tôi đã làm việc với nhiều công nghệ như Flutter, React Native và Swift.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: SizedBox(
                width: 315,
                height: 52.23,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Push',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  // Tạo danh sách 20 items mẫu
  final List<String> items = const [
    'Item 1 - Flutter Development',
    'Item 2 - React Native Apps',
    'Item 3 - iOS Swift Programming',
    'Item 4 - Android Kotlin',
    'Item 5 - UI/UX Design',
    'Item 6 - Backend Development',
    'Item 7 - Database Management',
    'Item 8 - API Integration',
    'Item 9 - Testing & Debugging',
    'Item 10 - Performance Optimization',
    'Item 11 - State Management',
    'Item 12 - Animation & Transitions',
    'Item 13 - Custom Widgets',
    'Item 14 - Platform Channels',
    'Item 15 - Firebase Integration',
    'Item 16 - Push Notifications',
    'Item 17 - Local Storage',
    'Item 18 - Network Requests',
    'Item 19 - Security Implementation',
    'Item 20 - App Store Deployment',
    'Item 1 - Flutter Development',
    'Item 2 - React Native Apps',
    'Item 3 - iOS Swift Programming',
    'Item 4 - Android Kotlin',
    'Item 5 - UI/UX Design',
    'Item 6 - Backend Development',
    'Item 7 - Database Management',
    'Item 8 - API Integration',
    'Item 9 - Testing & Debugging',
    'Item 10 - Performance Optimization',
    'Item 11 - State Management',
    'Item 12 - Animation & Transitions',
    'Item 13 - Custom Widgets',
    'Item 14 - Platform Channels',
    'Item 15 - Firebase Integration',
    'Item 16 - Push Notifications',
    'Item 17 - Local Storage',
    'Item 18 - Network Requests',
    'Item 19 - Security Implementation',
    'Item 20 - App Store Deployment',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            height: 75,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              title: Text(
                items[index],
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Mô tả chi tiết cho ${items[index]}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              DetailPage(title: items[index], index: index + 1),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final int index;

  const DetailPage({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết Item $index'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header với hình ảnh
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Icon(Icons.star, size: 80, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Tiêu đề
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            // Mô tả chi tiết
            Text(
              'Mô tả chi tiết',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 8),

            // // Expanded(
            //   child: SingleChildScrollView(
            //     child: Text(
            //       'Đây là trang chi tiết cho $title. '
            //       'Trong phần này, bạn có thể thêm nhiều thông tin chi tiết về item này. '
            //       'Ví dụ như mô tả đầy đủ, hình ảnh, video, hoặc bất kỳ nội dung nào khác mà bạn muốn hiển thị. '
            //       '\n\nBạn có thể tùy chỉnh giao diện này theo ý muốn, thêm các widget khác như Card, Container, '
            //       'hoặc bất kỳ component nào phù hợp với ứng dụng của bạn. '
            //       '\n\nĐây là một ví dụ về cách tạo navigation giữa các trang trong Flutter với LazyColumn (ListView) '
            //       'và trang detail với nút back về trang chủ.',
            //       style: GoogleFonts.poppins(
            //         fontSize: 14,
            //         height: 1.6,
            //         color: Colors.black87,
            //       ),
            //     ),
            //   ),
            // ),

            // Nút Back to Home
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to home (pop all routes)
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.home, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Back to Home',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
