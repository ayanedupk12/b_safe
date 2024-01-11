import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';

class MyJournalController extends GetxController {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> startRecordingAndUpload() async {
    try {
      final recorder = SocialMediaRecorder(
        sendRequestFunction: (File soundFile, String time) {
          // Process the recorded sound file or perform actions here
          // For example, upload the recorded file to Firebase Storage
          uploadAudioToFirebase(soundFile);
        },
      );

      final recordedFile = await recorder.startRecording!();

      if (recordedFile != null) {
        await uploadAudioToFirebase(recordedFile);
      } else {
        print('Recording failed');
      }
    } catch (e) {
      print('Error during recording and upload: $e');
    }
  }

  Future<void> uploadAudioToFirebase(File audioFile) async {
    try {
      final fileName = 'audio_${DateTime.now().millisecondsSinceEpoch}.aac';
      final reference = _storage.ref().child('audio').child(fileName);

      final uploadTask = reference.putFile(audioFile);
      final taskSnapshot = await uploadTask;
      final downloadURL = await taskSnapshot.ref.getDownloadURL();

      print('Uploaded audio URL: $downloadURL');
      // Use the downloadURL as needed
    } catch (e) {
      print('Error uploading audio: $e');
    }
  }
}
