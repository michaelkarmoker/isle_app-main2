class AnswarSubmitRequest {
  int? examId;
  List<int>? questionMasterId;
  List<McqAnswer>? mcqAnswer;
  List<WrittenAnswer>? writtenAnswer;

  AnswarSubmitRequest(
      {this.examId, this.questionMasterId, this.mcqAnswer, this.writtenAnswer});

  AnswarSubmitRequest.fromJson(Map<String, dynamic> json) {
    examId = json['exam_id'];
    questionMasterId = json['question_master_id'].cast<int>();
    if (json['mcq_answer'] != null) {
      mcqAnswer = <McqAnswer>[];
      json['mcq_answer'].forEach((v) {
        mcqAnswer!.add(new McqAnswer.fromJson(v));
      });
    }
    if (json['written_answer'] != null) {
      writtenAnswer = <WrittenAnswer>[];
      json['written_answer'].forEach((v) {
        writtenAnswer!.add(new WrittenAnswer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_id'] = this.examId;
    data['question_master_id'] = this.questionMasterId;
    if (this.mcqAnswer != null) {
      data['mcq_answer'] = this.mcqAnswer!.map((v) => v.toJson()).toList();
    }
    if (this.writtenAnswer != null) {
      data['written_answer'] =
          this.writtenAnswer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class McqAnswer {
  int? id;
  String? ans;

  McqAnswer({this.id, this.ans});

  McqAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ans = json['ans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ans'] = this.ans;
    return data;
  }
}

class WrittenAnswer {
  int? id;
  String? ans;

  WrittenAnswer({this.id, this.ans});

  WrittenAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ans = json['ans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ans'] = this.ans;
    return data;
  }
}