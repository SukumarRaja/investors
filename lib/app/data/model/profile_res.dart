class ProfileRes {
  ProfileRes({
    this.status,
    this.data,
  });

  dynamic status;
  Data? data;

  factory ProfileRes.fromMap(Map<String, dynamic> json) => ProfileRes(
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data!.toMap(),
      };
}

class Data {
  Data({
    this.indexId,
    this.mainId,
    this.name,
    this.dob,
    this.gender,
    this.father,
    this.spouse,
    this.mobile,
    this.mobile2,
    this.email,
    this.password,
    this.address,
    this.city,
    this.profession,
    this.professionDetail,
    this.income,
    this.office,
    this.designation,
    this.officeAddress,
    this.officePhone,
    this.officeMobile,
    this.photos,
    this.payMode,
    this.investment,
    this.investmentDate,
    this.returnsPercent,
    this.paymentMode,
    this.bankAccnumber,
    this.bankIfsc,
    this.bankName,
    this.bankBranch,
    this.regDate,
  });

  dynamic indexId;
  dynamic mainId;
  dynamic name;
  dynamic dob;
  dynamic gender;
  dynamic father;
  dynamic spouse;
  dynamic mobile;
  dynamic mobile2;
  dynamic email;
  dynamic password;
  dynamic address;
  dynamic city;
  dynamic profession;
  dynamic professionDetail;
  dynamic income;
  dynamic office;
  dynamic designation;
  dynamic officeAddress;
  dynamic officePhone;
  dynamic officeMobile;
  dynamic photos;
  dynamic payMode;
  dynamic investment;
  DateTime? investmentDate;
  dynamic returnsPercent;
  dynamic paymentMode;
  dynamic bankAccnumber;
  dynamic bankIfsc;
  dynamic bankName;
  dynamic bankBranch;
  DateTime? regDate;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        indexId: json["index_id"],
        mainId: json["main_id"],
        name: json["name"],
        dob: json["dob"],
        gender: json["gender"],
        father: json["father"],
        spouse: json["spouse"],
        mobile: json["mobile"],
        mobile2: json["mobile2"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        city: json["city"],
        profession: json["profession"],
        professionDetail: json["profession_detail"],
        income: json["income"],
        office: json["office"],
        designation: json["designation"],
        officeAddress: json["office_address"],
        officePhone: json["office_phone"],
        officeMobile: json["office_mobile"],
        photos: json["photos"],
        payMode: json["pay_mode"],
        investment: json["investment"],
        investmentDate: DateTime.parse(json["investment_date"]),
        returnsPercent: json["returns_percent"],
        paymentMode: json["payment_mode"],
        bankAccnumber: json["bank_accnumber"],
        bankIfsc: json["bank_ifsc"],
        bankName: json["bank_name"],
        bankBranch: json["bank_branch"],
        regDate: DateTime.parse(json["reg_date"]),
      );

  Map<String, dynamic> toMap() => {
        "index_id": indexId,
        "main_id": mainId,
        "name": name,
        "dob": dob,
        "gender": gender,
        "father": father,
        "spouse": spouse,
        "mobile": mobile,
        "mobile2": mobile2,
        "email": email,
        "password": password,
        "address": address,
        "city": city,
        "profession": profession,
        "profession_detail": professionDetail,
        "income": income,
        "office": office,
        "designation": designation,
        "office_address": officeAddress,
        "office_phone": officePhone,
        "office_mobile": officeMobile,
        "photos": photos,
        "pay_mode": payMode,
        "investment": investment,
        "investment_date":
            "${investmentDate!.year.toString().padLeft(4, '0')}-${investmentDate!.month.toString().padLeft(2, '0')}-${investmentDate!.day.toString().padLeft(2, '0')}",
        "returns_percent": returnsPercent,
        "payment_mode": paymentMode,
        "bank_accnumber": bankAccnumber,
        "bank_ifsc": bankIfsc,
        "bank_name": bankName,
        "bank_branch": bankBranch,
        "reg_date": regDate!.toIso8601String(),
      };
}
