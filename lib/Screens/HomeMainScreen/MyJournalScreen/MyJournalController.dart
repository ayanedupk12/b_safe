import 'dart:developer';
import 'dart:io';
import 'package:b_safe/Globalmodels/myJournalModel.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';

class MyJournalController extends GetxController {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  File? soundFile;
  File? attachedFile;
  MyJournalModel? myJournalModel;
  TextEditingController emailController=TextEditingController();
  TextEditingController whenDidItHappen=TextEditingController();
  TextEditingController whatHappened=TextEditingController();
  TextEditingController howDidItHappened=TextEditingController();

  Future<void> uploadMedia() async {

    try {
      // final recorder = SocialMediaRecorder(
      //   sendRequestFunction: (File soundFile, String time) {
      //     // Process the recorded sound file or perform actions here
      //     // For example, upload the recorded file to Firebase Storage
      //     uploadAudioToFirebase(soundFile);
      //   },
      // );

      // final recordedFile = await recorder.startRecording!();

      if (soundFile != null) {
        myJournalModel!.audioFile= await uploadAudioToFirebase(soundFile!);
        showMessage('Voice file uploaded');
      } else {
        showMessage('Voice file not attached');
      }

      if(attachedFile!=null){
        myJournalModel!.mediaFile = await uploadMediaToFirebase(attachedFile!);
      }else {
        showMessage('Media file not attached');
      }
    } catch (e) {
      print('Error during recording and upload: $e');
    }
  }

   uploadAudioToFirebase(File audioFile) async {
    try {
      final fileName = 'audio_${DateTime.now().millisecondsSinceEpoch}.aac';
      final reference = _storage.ref().child('audio').child(fileName);

      final uploadTask = reference.putFile(audioFile);
      final taskSnapshot = await uploadTask;
      final downloadURL = await taskSnapshot.ref.getDownloadURL();



      print('Uploaded audio URL: $downloadURL');
      return downloadURL;
      // Use the downloadURL as needed
    } catch (e) {
      print('Error uploading audio: $e');
      return null;
    }
  }

  uploadMediaToFirebase(File mediaFile) async {
    try {
      final fileName = mediaFile.path.split('/').last+DateTime.now().millisecondsSinceEpoch.toString()+mediaFile.path.split('.').last;
      final reference = _storage.ref().child('media').child(fileName);

      final uploadTask = reference.putFile(mediaFile);
      final taskSnapshot = await uploadTask;
      final downloadURL = await taskSnapshot.ref.getDownloadURL();



      print('Uploaded audio URL: $downloadURL');
      return downloadURL;
      // Use the downloadURL as needed
    } catch (e) {
      print('Error uploading audio: $e');
      return null;
    }
  }

  pickFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      log(file.path);
      attachedFile=file;
      update();
    } else {
      // User canceled the picker
    }
  }

  sendEmail(){
    myJournalModel!.whenDidItHappen=whenDidItHappen.text;
    myJournalModel!.whatHappened=whatHappened.text;
    myJournalModel!.howDidItHappened=howDidItHappened.text;


  }
}
