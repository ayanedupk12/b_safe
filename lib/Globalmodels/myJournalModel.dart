


class MyJournalModel {
  String? whenDidItHappen;
  String? whatHappened;
  String? howDidItHappened;
  String? audioFile;
  String? mediaFile;


  MyJournalModel({
     this.whenDidItHappen,
     this.whatHappened,
     this.howDidItHappened,
     this.audioFile,
     this.mediaFile,

  });

  factory MyJournalModel.fromJson(Map<String, dynamic> json) {
    return MyJournalModel(
      whenDidItHappen: json['whatDidHappen'],
      whatHappened: json['whatHappened'],
      howDidItHappened: json['howDidItHappened'],
      audioFile: json['audioFile'],
      mediaFile: json['mediaFile'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'whatDidHappen': whenDidItHappen,
      'whatHappened': whatHappened,
      'howDidItHappened': howDidItHappened,
      'audioFile': audioFile,
      'mediaFile': mediaFile,
    };
  }
}