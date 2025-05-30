import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayhi/thuchanh1_30_5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Components Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      home: const MyHomePage(title: "Navigation"),
    );
  }
}

class ComponentItem {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Widget page;

  ComponentItem({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.page,
  });
}

class ComponentsListScreen extends StatelessWidget {
  const ComponentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final components = [
      // Display section
      ComponentItem(
        title: 'Text',
        subtitle: 'Displays text',
        backgroundColor: Colors.blue.shade100,
        page: const TextDetailScreen(),
      ),
      ComponentItem(
        title: 'Image',
        subtitle: 'Displays an image',
        backgroundColor: Colors.blue.shade100,
        page: const ImagesScreen(),
      ),
      // Input section
      ComponentItem(
        title: 'TextField',
        subtitle: 'Text field for text',
        backgroundColor: Colors.blue.shade100,
        page: const TextFieldScreen(),
      ),
      ComponentItem(
        title: 'PasswordField',
        subtitle: 'Text field for passwords',
        backgroundColor: Colors.blue.shade100,
        page: const TextDetailScreen(),
      ),
      // Layout section
      ComponentItem(
        title: 'Column',
        subtitle: 'Arranges elements vertically',
        backgroundColor: Colors.blue.shade100,
        page: const TextDetailScreen(),
      ),
      ComponentItem(
        title: 'Row',
        subtitle: 'Arranges elements horizontally',
        backgroundColor: Colors.blue.shade100,
        page: const RowLayoutScreen(),
      ),
      // Additional section
      ComponentItem(
        title: 'Tự làm thử',
        subtitle: 'Thực tế để các thành phần UI Cơ bản',
        backgroundColor: Colors.pink.shade100,
        page: const TextDetailScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('UI Components List')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Display section
          const Text(
            'Display',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildComponentItem(context, components[0]),
          const SizedBox(height: 8),
          _buildComponentItem(context, components[1]),

          const SizedBox(height: 16),
          // Input section
          const Text(
            'Input',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildComponentItem(context, components[2]),
          const SizedBox(height: 8),
          _buildComponentItem(context, components[3]),

          const SizedBox(height: 16),
          // Layout section
          const Text(
            'Layout',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildComponentItem(context, components[4]),
          const SizedBox(height: 8),
          _buildComponentItem(context, components[5]),

          const SizedBox(height: 16),
          // Additional section
          _buildComponentItem(context, components[6]),
        ],
      ),
    );
  }

  Widget _buildComponentItem(BuildContext context, ComponentItem item) {
    return Container(
      decoration: BoxDecoration(
        color: item.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(item.title),
        subtitle: Text(item.subtitle),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => item.page),
          );
        },
      ),
    );
  }
}

// Text Detail Screen
class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Detail'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 28,
                color: Colors.black,
                height: 1.4,
              ),
              children: [
                const TextSpan(text: 'The '),
                const TextSpan(
                  text: 'quick ',
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
                TextSpan(
                  text: 'Brown',
                  style: TextStyle(
                    color: Colors.orange.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: '\nfox '),
                const TextSpan(text: 'j u m p s '),
                const TextSpan(
                  text: 'over',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: '\n'),
                const TextSpan(
                  text: 'the ',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text: 'lazy',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.wavy,
                    decorationColor: Colors.red,
                  ),
                ),
                const TextSpan(text: ' dog.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Images Screen
class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Images')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs7xai-43it1XUbXNJd9cERnivt7IUV0VTJQ&s',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: const Text(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs7xai-43it1XUbXNJd9cERnivt7IUV0VTJQ&s',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://giaothongvantaitphcm.edu.vn/wp-content/uploads/2024/06/ky-niem-36-nam-thanh-lap-truong-dai-hoc-giao-thong-van-tai-tphcm-560px.jpg',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            const Text('01/2023', textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }
}

// TextField Screen
class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Nhập từ khóa...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                // Also apply the rounded corners to focused border
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              inputText.isEmpty ? 'Đang chờ nhập từ khóa...' : inputText,
              style: TextStyle(
                color: inputText.isEmpty ? Colors.red.shade300 : Colors.red,
                fontWeight:
                    inputText.isEmpty ? FontWeight.normal : FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Row Layout Screen
class RowLayoutScreen extends StatelessWidget {
  const RowLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row Layout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildRowOfBoxes(),
            const SizedBox(height: 16),
            _buildRowOfBoxes(),
            const SizedBox(height: 16),
            _buildRowOfBoxes(),
            const SizedBox(height: 16),
            _buildRowOfBoxes(),
          ],
        ),
      ),
    );
  }

  Widget _buildRowOfBoxes() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade500,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
