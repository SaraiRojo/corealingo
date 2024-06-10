import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necesario para rootBundle
import 'package:soundpool/soundpool.dart';

class SimplePage extends StatefulWidget {
  SimplePage({Key? key}) : super(key: key);

  @override
  _SimplePageState createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  late Soundpool pool;
  int? soundId;
  int? streamId;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    pool = Soundpool(streamType: StreamType.notification);
    loadSound();
  }

  Future<void> loadSound() async {
    soundId = await rootBundle.load("assets/audio/vocal.mp3").then((ByteData soundData) {
      return pool.load(soundData);
    });
  }

  Future<void> _soundbutton() async {
    if (isPlaying && streamId != null) {
      await pool.stop(streamId!);
      isPlaying = false;
      streamId = null; // Reset the streamId after stopping
    } else {
      if (soundId != null) {
        streamId = await pool.play(soundId!);
        isPlaying = true;
      }
    }
    if (mounted) setState(() {}); // Update the state if the widget is still mounted
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> vowels = [
      {'vowel': 'ㅏ', 'pronunciation': 'a'},
      {'vowel': 'ㅑ', 'pronunciation': 'ya'},
      {'vowel': 'ㅓ', 'pronunciation': 'eo'},
      {'vowel': 'ㅕ', 'pronunciation': 'yeo'},
      {'vowel': 'ㅗ', 'pronunciation': 'o'},
      {'vowel': 'ㅛ', 'pronunciation': 'yo'},
      {'vowel': 'ㅜ', 'pronunciation': 'u'},
      {'vowel': 'ㅠ', 'pronunciation': 'yu'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Vocales Hangul', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(isPlaying ? Icons.headset_off : Icons.headset),
            onPressed: _soundbutton,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: vowels.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(vowels[index]['vowel']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                subtitle: Text(vowels[index]['pronunciation']!, style: TextStyle(fontSize: 18, color: Colors.grey)),
                leading: Icon(Icons.record_voice_over, color: Colors.blue),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (streamId != null) {
      pool.stop(streamId!); // Ensure to stop the sound before releasing the pool
    }
    pool.release();
    super.dispose();
  }
}
