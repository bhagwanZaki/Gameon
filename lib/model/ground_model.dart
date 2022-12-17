// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Ground {
  String title;
  String address;
  String far;
  String pitch;
  String img;
  Ground({
    required this.title,
    required this.address,
    required this.far,
    required this.pitch,
    required this.img,
  });

  Ground copyWith({
    String? title,
    String? address,
    String? far,
    String? pitch,
    String? img,
  }) {
    return Ground(
      title: title ?? this.title,
      address: address ?? this.address,
      far: far ?? this.far,
      pitch: pitch ?? this.pitch,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'address': address,
      'far': far,
      'pitch': pitch,
      'img': img,
    };
  }

  factory Ground.fromMap(Map<String, dynamic> map) {
    return Ground(
      title: map['title'] as String,
      address: map['address'] as String,
      far: map['far'] as String,
      pitch: map['pitch'] as String,
      img: map['img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ground.fromJson(String source) => Ground.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Ground(title: $title, address: $address, far: $far, pitch: $pitch, img: $img)';
  }

  @override
  bool operator ==(covariant Ground other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.address == address &&
      other.far == far &&
      other.pitch == pitch &&
      other.img == img;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      address.hashCode ^
      far.hashCode ^
      pitch.hashCode ^
      img.hashCode;
  }
}
