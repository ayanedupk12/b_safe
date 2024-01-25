import 'dart:developer';
import 'dart:io';
import 'package:b_safe/Globalmodels/myJournalModel.dart';
import 'package:b_safe/Utils/Colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';

class MyJournalController extends GetxController {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  GlobalKey<FormState> globalKey=GlobalKey();
  bool uploading=false;

  File? soundFile;
  String? soundFileURL;
  File? attachedFile;
  String? attachedFileURL;
  TextEditingController emailController=TextEditingController();
  TextEditingController whenDidItHappen=TextEditingController();
  TextEditingController whatHappened=TextEditingController();
  TextEditingController howDidItHappened=TextEditingController();

  Future<void> uploadMedia() async {

    uploading=true;
    update();

    // await Future.delayed(Duration(seconds: 3));
    // print('object');

    if(globalKey.currentState!.validate()){
      Get.back();
      // print('call 1');
      // try {
      // final recorder = SocialMediaRecorder(
      //   sendRequestFunction: (File soundFile, String time) {
      //     // Process the recorded sound file or perform actions here
      //     // For example, upload the recorded file to Firebase Storage
      //     uploadAudioToFirebase(soundFile);
      //   },
      // );

      // final recordedFile = await recorder.startRecording!();

      if (soundFile != null) {
        soundFileURL= await uploadAudioToFirebase(soundFile!);
        showMessage('Voice file uploaded');
      } else {
        showMessage('Voice file not attached');
      }
      if(attachedFile!=null){
        attachedFileURL = await uploadMediaToFirebase(attachedFile!);
      }else {
        showMessage('Media file not attached');
      }
      await sendEmail();
      // } catch (e) {
      //   print('Error during recording and upload: $e');
      // }
    }
    clearController();
    uploading=false;
    update();
  }
  clearController(){
    whenDidItHappen.clear();
    whatHappened.clear();
    howDidItHappened.clear();
    emailController.clear();
     soundFile=null;
     soundFileURL=null;
     attachedFile=null;
    attachedFileURL=null;
  }

   Future<String> uploadAudioToFirebase(File audioFile) async {
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
      return '';
    }
  }

  uploadMediaToFirebase(File mediaFile) async {
    try {
      final fileName = mediaFile.path.split('/').last+DateTime.now().millisecondsSinceEpoch.toString()+'.'+mediaFile.path.split('.').last;
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

  sendEmail()async{
    // if(globalKey.currentState!.validate()){
      // myJournalModel.whenDidItHappen=whenDidItHappen.text;
      // myJournalModel.whatHappened=whatHappened.text;
      // myJournalModel.howDidItHappened=howDidItHappened.text;

    //   String emailBody=
    //   '''
    // when Did It Happen?\n
    // ${whenDidItHappen.text}\n\n
    // what Happened?\n
    // ${whatHappened.text}\n\n
    // how Did ItHappened?\n
    // ${howDidItHappened.text}\n\n
    //
    // Video:${attachedFileURL}\n\n
    // Voice:${soundFileURL}
    //
    // ''';


      String username = 'ayan.edu.pk13@gmail.com';
      String password = 'oxzlymiefauedity';

      final smtpServer = gmail(username, password);
      // Use the SmtpServer class to configure an SMTP server:
      // final smtpServer = SmtpServer('smtp.domain.com');
      // See the named arguments of SmtpServer for further configuration
      // options.

      // Create our message.
      final message = Message()
        ..from = Address(username, 'Besafe4U')
        ..recipients.add(emailController.text)
        // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
        // ..bccRecipients.add(Address('bccAddress@example.com'))
        ..subject = 'My Journal Report'
        ..text = ''
        ..html ='''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Details</title>
</head>
<body>

    <h2>When Did It Happen?</h2>
    <p>${whenDidItHappen.text}</p>

    <h2>What Happened?</h2>
    <p>${whatHappened.text}</p>

    <h2>How Did It Happen?</h2>
    <p>${howDidItHappened.text}</p>

    <h2>File:</h2>
    <p><a href="${attachedFileURL}">${attachedFileURL}</a></p>

    <h2>Voice:</h2>
    <p><a href="${soundFileURL}">${soundFileURL}</a></p>

</body>
</html>
  ''';

      try {
        final sendReport = await send(message, smtpServer);
        print('Message sent: ' + sendReport.toString());
      } on MailerException catch (e) {
        showMessage('Message not sent.');
        for (var p in e.problems) {
          showMessage('Problem: ${p.code}: ${p.msg}');
        }
      }

      // final Email email = Email(
      //   body: emailBody,
      //   subject: 'BSafe4U',
      //   recipients: [emailController.text],
      //   // cc: ['cc@example.com'],
      //   // bcc: ['bcc@example.com'],
      //   // attachmentPaths: ['/path/to/attachment.zip'],
      //   isHTML: false,
      // );
      //
      // await FlutterEmailSender.send(email);
      Get.back();


  }
}
