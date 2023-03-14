class LedgerRes {
  LedgerRes({
    this.status,
    this.data,
  });

  dynamic status;
  List<Datum>? data;

  factory LedgerRes.fromMap(Map<String, dynamic> json) => LedgerRes(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.indexId,
    this.investorId,
    this.amount,
    this.amountType,
    this.withdrawOn,
    this.createdOn,
    this.status,
  });

  dynamic indexId;
  dynamic investorId;
  dynamic amount;
  dynamic amountType;
  DateTime? withdrawOn;
  DateTime? createdOn;
  dynamic status;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        indexId: json["index_id"],
        investorId: json["investor_id"],
        amount: json["amount"],
        amountType: json["amount_type"],
        withdrawOn: DateTime.parse(json["withdraw_on"]),
        createdOn: DateTime.parse(json["created_on"]),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "index_id": indexId,
        "investor_id": investorId,
        "amount": amount,
        "amount_type": amountType,
        "withdraw_on":
            "${withdrawOn!.year.toString().padLeft(4, '0')}-${withdrawOn!.month.toString().padLeft(2, '0')}-${withdrawOn!.day.toString().padLeft(2, '0')}",
        "created_on": createdOn!.toIso8601String(),
        "status": status,
      };
}
