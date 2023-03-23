
import 'package:f1_api/api/f1_api.dart';
import 'package:f1_api/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final F1Api api;  

  setUpAll(() => api = F1Api(
    baseUrl: 'https://fia-formula-1-championship-statistics.p.rapidapi.com', 
    apiKey: '556adc7937mshe49ff6747a44e12p19818bjsna1de7d06d378')
  );

  test('Get driver',() async{
    final DriverResult? driver = await api.getDriver('maxverstappen');
    print(driver!.firstname);
  });

  test('Get drivers',() async{
    final List<DriversResult>? drivers = await api.getDrivers();

    print(drivers![0].points);
  });

  test('Get teams',() async{
    final List<TeamsResult>? teams = await api.getTeams();

    print(teams![0].rank!['standing']);
  });
}