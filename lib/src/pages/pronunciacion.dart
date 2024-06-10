import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necesario para rootBundle
import 'package:soundpool/soundpool.dart';

class PronunciacionPage extends StatefulWidget {
  PronunciacionPage({Key? key}) : super(key: key);

  @override
  _PronunciacionPageState createState() => _PronunciacionPageState();
}

class _PronunciacionPageState extends State<PronunciacionPage> {
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
    soundId = await rootBundle.load("assets/audio/numeros.mp3").then((ByteData soundData) {
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
    List<Map<String, String>> numbers = List.generate(20, (index) {
      return {
        'number': '${index + 1}',
        'korean': _getKoreanNumber(index + 1),
        'pronunciation': _getKoreanPronunciation(index + 1)
      };
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Números en Hangul', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(isPlaying ? Icons.headset_off : Icons.headset),
            onPressed: _soundbutton,
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue[700],
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    numbers[index]['number']!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    numbers[index]['korean']!,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    numbers[index]['pronunciation']!,
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getKoreanNumber(int number) {
    const koreanNumbers = [
      "일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십",
      "십일", "십이", "십삼", "십사", "십오", "십육", "십칠", "십팔", "십구", "이십"
    ];
    return koreanNumbers[number - 1];
  }

  String _getKoreanPronunciation(int number) {
    const koreanPronunciations = [
      "hana", "dul", "set", "net", "daseot", "yeoseot", "ilgop", "yeodeol", "ahop", "yeol",
      "yeolhana", "yeoldul", "yeolset", "yeol-let", "yeoldaseot", "yeol-lyeoseot", "yeorilgob", "yeol-lyeodeol", "yeorahop", "seumul"
    ];
    return koreanPronunciations[number - 1];
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
