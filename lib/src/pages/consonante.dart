import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necesario para rootBundle
import 'package:soundpool/soundpool.dart';

class ConsonantePage extends StatefulWidget {
  ConsonantePage({Key? key}) : super(key: key);

  @override
  _ConsonantePageState createState() => _ConsonantePageState();
}

class _ConsonantePageState extends State<ConsonantePage> {
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
    soundId = await rootBundle.load("assets/audio/consonante.mp3").then((ByteData soundData) {
      return pool.load(soundData);
    });
  }

  Future<void> _toggleSound() async {
    if (isPlaying) {
      if (streamId != null) {
        await pool.stop(streamId!);
        isPlaying = false;
      }
    } else {
      if (soundId != null) {
        streamId = await pool.play(soundId!);
        isPlaying = true;
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> consonants = [
      {'consonante': 'ㄱ', 'pronunciación': 'g/k'},
      {'consonante': 'ㄴ', 'pronunciación': 'n'},
      {'consonante': 'ㄷ', 'pronunciación': 'd/t'},
      {'consonante': 'ㄹ', 'pronunciación': 'r/l'},
      {'consonante': 'ㅁ', 'pronunciación': 'm'},
      {'consonante': 'ㅂ', 'pronunciación': 'b/p'},
      {'consonante': 'ㅅ', 'pronunciación': 's'},
      {'consonante': 'ㅇ', 'pronunciación': 'ng'},
      {'consonante': 'ㅈ', 'pronunciación': 'j'},
      {'consonante': 'ㅊ', 'pronunciación': 'ch'},
      {'consonante': 'ㅋ', 'pronunciación': 'k'},
      {'consonante': 'ㅌ', 'pronunciación': 't'},
      {'consonante': 'ㅍ', 'pronunciación': 'p'},
      {'consonante': 'ㅎ', 'pronunciación': 'h'}
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Consonantes Hangul', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: _toggleSound,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: consonants.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(consonants[index]['consonante']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                subtitle: Text(consonants[index]['pronunciación']!, style: TextStyle(fontSize: 18, color: Colors.grey)),
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
      pool.stop(streamId!);
    }
    pool.release();
    super.dispose();
  }
}
