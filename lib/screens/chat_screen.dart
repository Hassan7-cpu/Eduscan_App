// ignore_for_file: unused_field

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:file_picker/file_picker.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;
  bool isLoading = false;
  bool isPaused = false;

  /// إرسال رسالة نصية
  void _sendTextMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'type': 'text',
        'text': text.trim(),
        'isSender': true,
        'date': DateTime.now(),
      });
    });

    _controller.clear();
  }

  /// اختيار صورة من المعرض
  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _messages.add({
          'type': 'image',
          'path': picked.path,
          'isSender': true,
          'date': DateTime.now(),
        });
      });
    }
  }

  /// اختيار ملف صوتي

  Future<void> _pickAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'aac'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _messages.add({
          'type': 'audio',
          'path': result.files.single.path!,
          'isSender': true,
          'date': DateTime.now(),
        });
      });
    }
  }

  /// تشغيل الصوت
  Future<void> _playAudio(String path) async {
    try {
      isLoading = true;
      setState(() {});
      await _audioPlayer.setFilePath(path);
      await _audioPlayer.play();

      _audioPlayer.positionStream.listen((pos) {
        setState(() => position = pos);
      });

      _audioPlayer.durationStream.listen((dur) {
        setState(() => duration = dur ?? Duration.zero);
      });

      _audioPlayer.playerStateStream.listen((state) {
        setState(() {
          isPlaying = state.playing;
          isPaused =
              state.processingState == ProcessingState.ready && !state.playing;
          isLoading = state.processingState == ProcessingState.loading;
        });
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  /// تغيير موضع الصوت
  void _changeSeek(double value) {
    _audioPlayer.seek(Duration(seconds: value.toInt()));
  }

  /// بناء كل رسالة (فقاعة)
  Widget _buildBubble(Map<String, dynamic> msg) {
    final bool isSender = msg['isSender'] ?? false;

    switch (msg['type']) {
      case 'text':
        return BubbleNormal(
          text: msg['text'],
          isSender: isSender,
          color: isSender ? const Color(0xFFE8E8EE) : const Color(0xFF1B97F3),
          tail: true,
          textStyle: TextStyle(
            fontSize: 16.sp,
            color: isSender ? Colors.black : Colors.white,
          ),
        );

      case 'image':
        return BubbleNormalImage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          image: Image.file(File(msg['path']), fit: BoxFit.cover),
          isSender: isSender,
          color: isSender ? const Color(0xFFE8E8EE) : const Color(0xFF1B97F3),
          tail: true,
        );

      case 'audio':
        return BubbleNormalAudio(
          color: const Color(0xFFE8E8EE),
          duration: duration.inSeconds.toDouble(),
          position: position.inSeconds.toDouble(),
          isPlaying: isPlaying,
          isLoading: isLoading,
          isPause: isPaused,
          onSeekChanged: _changeSeek,
          onPlayPauseButtonClick: () => _playAudio(msg['path']),
          sent: true,
        );

      default:
        return const SizedBox();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final reversedIndex = _messages.length - 1 - index;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: _buildBubble(_messages[reversedIndex]),
                );
              },
            ),
          ),
          MessageBar(
            onSend: _sendTextMessage,
            actions: [
              InkWell(
                onTap: _pickImage,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.image, color: Colors.green, size: 24),
                ),
              ),
              InkWell(
                onTap: _pickAudio,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.audiotrack, color: Colors.blue, size: 24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
