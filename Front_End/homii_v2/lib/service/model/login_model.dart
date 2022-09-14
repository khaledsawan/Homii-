class LoginModel {
  Data? data;

  LoginModel({this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? mobile;
  String? gender;
  String? age;
  String? city;
  String? universityCollege;
  String? academicYear;
  String? universityCard;
  Null? houseId;
  String? description;
  int? points;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? token;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.userName,
        this.email,
        this.mobile,
        this.gender,
        this.age,
        this.city,
        this.universityCollege,
        this.academicYear,
        this.universityCard,
        this.houseId,
        this.description,
        this.points,
        this.createdAt,
        this.updatedAt,
        this.role,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['user_name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    age = json['age'];
    city = json['city'];
    universityCollege = json['university_college'];
    academicYear = json['academic_year'];
    universityCard = json['university_card'];
    houseId = json['house_id'];
    description = json['description'];
    points = json['points'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['user_name'] = userName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['age'] = age;
    data['city'] = city;
    data['university_college'] = universityCollege;
    data['academic_year'] = academicYear;
    data['university_card'] = universityCard;
    data['house_id'] = houseId;
    data['description'] = description;
    data['points'] = points;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['role'] = role;
    data['token'] = token;
    return data;
  }
}