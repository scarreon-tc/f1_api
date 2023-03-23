class DriversResult{

  DriversResult({
    this.rank, 
    this.points, 
    this.firstname, 
    this.lastname, 
    this.abbr
  });

  final int? rank;
  final int? points;
  final String? firstname;
  final String? lastname;
  final bool? abbr;

  @override
  String toString() {
    return '$firstname $lastname';
  }
}