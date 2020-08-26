class Task {
  Task({
    this.id,
    this.payload,
    this.target,
    this.partialData,
    this.algorithm,
  });

  int id;
  Payload payload;
  List<int> target;
  List<int> partialData;
  String algorithm;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    payload: Payload.fromJson(json["payload"]),
    target: List<int>.from(json["target"].map((x) => x)),
    partialData: List<int>.from(json["partial_data"].map((x) => x)),
    algorithm: json["algorithm"],
  );

  Map<String, dynamic> toJson() => {
    "payload": payload.toJson(),
    "target": List<dynamic>.from(target.map((x) => x)),
    "partial_data": List<dynamic>.from(partialData.map((x) => x)),
    "algorithm": algorithm,
  };
}

class Payload {
  Payload({
    this.prefix,
    this.start,
    this.count,
    this.alphabet,
  });

  List<int> prefix;
  List<int> start;
  int count;
  List<int> alphabet;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    prefix: List<int>.from(json["prefix"].map((x) => x)),
    start: List<int>.from(json["start"].map((x) => x)),
    count: json["count"],
    alphabet: List<int>.from(json["alphabet"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "prefix": List<dynamic>.from(prefix.map((x) => x)),
    "start": List<dynamic>.from(start.map((x) => x)),
    "count": count,
    "alphabet": List<dynamic>.from(alphabet.map((x) => x)),
  };
}
