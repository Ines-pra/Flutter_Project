import 'dart:core';

class Travel {
  late String name;
  late String destination;
  late String description;
  late String date;
  late String lienImage;

  getName() {
    return name;
  }

  setName(String name) {
    this.name = name;
  }

  getDestination() {
    return destination;
  }

  setDestination(String destination) {
    this.destination = destination;
  }

  getDescription() {
    return description;
  }

  setDescription(String description) {
    this.description = description;
  }

  getDate() {
    return date;
  }

  setDate(String date) {
    this.date = date;
  }

  getImage() {
    return lienImage;
  }

  setImage(String lienImage) {
    this.lienImage = lienImage;
  }
}
