import 'dart:math';

getRandomNumber() {
  var rng = new Random();
  return rng.nextInt(3);
}

class Contact {
  final String title;
  final String subtitle;
  final String time;
  String profile;
  
  Contact(this.title, this.subtitle, this.time, this.profile);

  setProfile(String url) {
    this.profile = url;
  }

  Contact.fromJson(Map<String, dynamic> json) :
    title = getRandomNumber() > 0? json['name'] : json['phone'],
    subtitle = json['greeting'],
    time = json['title'],
    profile = json['picture'];
}