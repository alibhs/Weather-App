class Rain {
  double? onehour;

  Rain({this.onehour});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        onehour: (json['day'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'day': onehour,
      };
}
