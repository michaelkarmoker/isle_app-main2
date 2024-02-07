class LoginBody {
  String? user_name;
  String? password;


  LoginBody({this.user_name, this.password});

  LoginBody.fromJson(Map<String, dynamic> json) {
    user_name = json['email'];
    password = json['password'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.user_name!=null){
      data['email'] = this.user_name;
    }
    if(this.password!=null){
      data['password'] = this.password;
    }


    return data;
  }

  @override
  String toString() {
    return '{email: $user_name, password: $password}';
  }
}