class MarkSubmitRequest {
  int? studentExamResponseId;
  List<Answer>? answer;

  MarkSubmitRequest({this.studentExamResponseId, this.answer});

  MarkSubmitRequest.fromJson(Map<String, dynamic> json) {
    studentExamResponseId = json['student_exam_response_id'];
    if (json['answer'] != null) {
      answer = <Answer>[];
      json['answer'].forEach((v) {
        answer!.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_exam_response_id'] = this.studentExamResponseId;
    if (this.answer != null) {
      data['answer'] = this.answer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  int? id;
  String? marks;
  String? remarks;

  Answer({this.id, this.marks, this.remarks});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marks = json['marks'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['marks'] = this.marks;
    data['remarks'] = this.remarks;
    return data;
  }
}
