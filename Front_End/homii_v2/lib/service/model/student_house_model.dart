class StudentHouseModel {
  List<Data> data=[];

  StudentHouseModel({required this.data});

  StudentHouseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  int? id;
  int? officeId;
  String? address;
  int? numberStudents;
  int? numberRoom;
  String? price;
  int? rented;
  String? description;
  String? createdAt;
  String? updatedAt;
  Null? type;
  dynamic discount;
  dynamic newPrice;

  Data(
      {this.id,
        this.officeId,
        this.address,
        this.numberStudents,
        this.numberRoom,
        this.price,
        this.rented,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.type,
        this.discount,
        this.newPrice});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    officeId = json['office_id'];
    address = json['address'];
    numberStudents = json['number_students'];
    numberRoom = json['number_room'];
    price = json['price'];
    rented = json['rented'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    discount = json['discount'];
    newPrice = json['newPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['office_id'] = officeId;
    data['address'] = address;
    data['number_students'] = numberStudents;
    data['number_room'] = numberRoom;
    data['price'] = price;
    data['rented'] = rented;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    data['discount'] = discount;
    data['newPrice'] = newPrice;
    return data;
  }
}