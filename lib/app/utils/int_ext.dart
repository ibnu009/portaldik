extension IntegerExt on int? {

  bool isStatusSuccess() {
    if (this == null) return false;
    return (this == 200 || this == 201);
  }
}
