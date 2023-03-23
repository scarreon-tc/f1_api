class TeamsResult{

  TeamsResult({
    this.rank, 
    this.points, 
    this.teamName, 
    this.drivers, 
  });

  final Map<String, dynamic>? rank;
  final Map<String, dynamic>? points;
  final String? teamName;
  final List<dynamic>? drivers;
}