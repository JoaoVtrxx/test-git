class LoginModel {
  String? name;
  String? mail;
  String? password;
  bool? keppOn;

  LoginModel({this.name, this.mail, this.password, this.keppOn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name']!;
    mail = json['mail']!;
    password = json['password']!;
    keppOn = json['keppOn']!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name!;
    data['mail'] = this.mail!;
    data['password'] = this.password!;
    data['keppOn'] = this.keppOn!;
    return data;
  }

  String toString() {
    return "Name: " +
        this.name! +
        "\nE-mail: " +
        this.mail! +
        "\nSenha: " +
        this.password!;
  }
}
