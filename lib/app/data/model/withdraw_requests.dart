class WithdrawRequestsRes {
  WithdrawRequestsRes({
    this.status,
    this.data,
  });

  dynamic status;
  List<Datum>? data;

  factory WithdrawRequestsRes.fromMap(Map<String, dynamic> json) =>
      WithdrawRequestsRes(
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
    this.requestedOn,
    this.approvedOn,
    this.rejectReason,
    this.status,
  });

  dynamic indexId;
  dynamic investorId;
  dynamic amount;
  dynamic requestedOn;
  dynamic approvedOn;
  dynamic rejectReason;
  dynamic status;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        indexId: json["index_id"],
        investorId: json["investor_id"],
        amount: json["amount"],
        requestedOn: json["requested_on"],
        approvedOn: json["approved_on"],
        rejectReason: json["reject_reason"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "index_id": indexId,
        "investor_id": investorId,
        "amount": amount,
        "requested_on": requestedOn,
        "approved_on": approvedOn,
        "reject_reason": rejectReason,
        "status": status
      };
}
