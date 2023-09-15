import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
class UserDetails
{
    String? name;
    String? email;
    String? phone;
    String? address;
    String? image;


    UserDetails({ this.name ,  this.email ,  this.phone , this.address});   


UserDetails.fromJson(Map<String, dynamic> json) {
     UserDetails(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
    );
}


Map<String , dynamic> toJson(UserDetails userDetails) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = userDetails.name;
    data['email'] = userDetails.email;
    data['phone'] = userDetails.phone;
    data['address'] = userDetails.address;
    return data;
}

static UserDetails? fromSnapshot(DocumentSnapshot snap) {
    UserDetails userdetails =   UserDetails(
        name: snap['name'],
        email: snap['email'],
        phone: snap['phone'],
        address: snap['address'],
    );
    return userdetails;
}



}
