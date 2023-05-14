extension StringExtension on String? {
  String get nullToEmpty => this ?? '';

  String? get emptyToNull => this?.trim() == '' ? null : this;

  String get capitalize {
    if(this == null) return '';
    return this![0].toUpperCase() + this!.substring(1);
  }

  bool get isEmptyOrNull {
    if(this == null) return true;
    if(this!.isEmpty) return true;
    return false;
  }

  String get capitalizeAllFirst {
    if(this == null) return '';
    List<String> words = this!.split(" ");
    return words.map((e) => e.capitalize).join(" ");
  }

  String pluralize([num? number]){
    if(this == null) return '';
    if((number ?? 1) > 1) return '${this!}s';
    return this!;
  }
}