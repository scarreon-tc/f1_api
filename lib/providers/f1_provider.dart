import 'package:f1_api/models/models.dart';
import 'package:flutter/material.dart';

import '../api/dio.dart';

class F1Provider extends ChangeNotifier {
  List<DriversResult> drivers = [];
  DriverResult? currentDriver;
  List<TeamsResult> teams = [];

  Future<bool> getDriver(String driverName) async {
    final response = await Api.httpGet('/api/drivers/details/$driverName');
    // final data = {
    //   "driverDetails": {
    //     "team": "Red Bull Racing",
    //     "country": "Netherlands",
    //     "podiums": "79",
    //     "points": "2055.5",
    //     "grandsPrixEntered": "165",
    //     "worldChampionships": "2",
    //     "highestRaceFinish": "1 (x36)",
    //     "highestGridPosition": "1",
    //     "dateOfBirth": "30/09/1997",
    //     "placeOfBirth": "Hasselt, Belgium",
    //     "firstname": "Max",
    //     "lastname": "Verstappen",
    //     "abbr": null
    //   },
    //   "httpStatusCode": 200
    // };

    //await Future.delayed(const Duration(seconds: 2));
    if (response.data != null) {
      final data = response.data;

      if (data.containsKey('driverDetails')) {
        final content = data['driverDetails'];

        if (content is Map<String, dynamic>?) {
          final driverJson = content;

          final instance = DriverResult(
              team: driverJson?['team'],
              country: driverJson?['country'],
              podiums: driverJson?['podiums'],
              points: driverJson?['points'],
              grandsPrixEntered: driverJson?['grandsPrixEntered'],
              worldChampionships: driverJson?['worldChampionships'],
              highestRaceFinish: driverJson?['highestRaceFinish'],
              highestGridPosition: driverJson?['highestGridPosition'],
              dateOfBirth: driverJson?['dateOfBirth'],
              placeOfBirth: driverJson?['placeOfBirth'],
              firstname: driverJson?['firstname'],
              lastname: driverJson?['lastname'],
              abbr: driverJson?['abbr']);

          currentDriver = instance;
        }
      }
    }
    return true;
  }

  Future<bool> getDrivers() async {
    if (drivers.isEmpty) {
      final response = await Api.httpGet('/api/drivers');

      // final data = {
      //   "drivers": [
      //     {
      //       "rank": 1,
      //       "points": 44,
      //       "firstname": "Max",
      //       "lastname": "Verstappen",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 2,
      //       "points": 43,
      //       "firstname": "Sergio",
      //       "lastname": "Perez",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 3,
      //       "points": 30,
      //       "firstname": "Fernando",
      //       "lastname": "Alonso",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 4,
      //       "points": 20,
      //       "firstname": "Carlos",
      //       "lastname": "Sainz",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 5,
      //       "points": 20,
      //       "firstname": "Lewis",
      //       "lastname": "Hamilton",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 6,
      //       "points": 18,
      //       "firstname": "George",
      //       "lastname": "Russell",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 7,
      //       "points": 8,
      //       "firstname": "Lance",
      //       "lastname": "Stroll",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 8,
      //       "points": 6,
      //       "firstname": "Charles",
      //       "lastname": "Leclerc",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 9,
      //       "points": 4,
      //       "firstname": "Valtteri",
      //       "lastname": "Bottas",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 10,
      //       "points": 4,
      //       "firstname": "Esteban",
      //       "lastname": "Ocon",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 11,
      //       "points": 4,
      //       "firstname": "Pierre",
      //       "lastname": "Gasly",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 12,
      //       "points": 1,
      //       "firstname": "Kevin",
      //       "lastname": "Magnussen",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 13,
      //       "points": 1,
      //       "firstname": "Alexander",
      //       "lastname": "Albon",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 14,
      //       "points": 0,
      //       "firstname": "Yuki",
      //       "lastname": "Tsunoda",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 15,
      //       "points": 0,
      //       "firstname": "Nico",
      //       "lastname": "Hulkenberg",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 16,
      //       "points": 0,
      //       "firstname": "Logan",
      //       "lastname": "Sargeant",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 17,
      //       "points": 0,
      //       "firstname": "Guanyu",
      //       "lastname": "Zhou",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 18,
      //       "points": 0,
      //       "firstname": "Nyck",
      //       "lastname": "De Vries",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 19,
      //       "points": 0,
      //       "firstname": "Oscar",
      //       "lastname": "Piastri",
      //       "abbr": null
      //     },
      //     {
      //       "rank": 20,
      //       "points": 0,
      //       "firstname": "Lando",
      //       "lastname": "Norris",
      //       "abbr": null
      //     }
      //   ],
      //   "httpStatusCode": 200
      // };

      //await Future.delayed(const Duration(seconds: 2));

      if (response.data != null) {
        final data = response.data;

        if (data.containsKey('drivers')) {
          final content = data['drivers'];

          if (content is List<dynamic>?) {
            final teamsList = content;

            if (teamsList != null && teamsList.isNotEmpty) {
              for (final driverData in teamsList) {
                if (driverData is Map<String, dynamic>) {
                  final driverJson = driverData;

                  final instance = DriversResult(
                    rank: int.tryParse(driverJson['rank'].toString()),
                    points: int.tryParse(driverJson['points'].toString()),
                    firstname: driverJson['firstname'],
                    lastname: driverJson['lastname'],
                    abbr: driverJson['abbr'],
                  );

                  drivers.add(instance);
                }
              }
            }
          }
        }
      }
    }
    return true;
  }

  Future<bool> getTeams() async {
    if (teams.isEmpty) {
      final response = await Api.httpGet('/api/teams');

      //await Future.delayed(const Duration(seconds: 2));

      if (response.data != null) {
        final data = response.data;

        if (data.containsKey('teams')) {
          final content = data['teams'];

          if (content is List<dynamic>?) {
            final teamsList = content;

            if (teamsList != null && teamsList.isNotEmpty) {
              for (final driverData in teamsList) {
                if (driverData is Map<String, dynamic>) {
                  final driverJson = driverData;

                  final instance = TeamsResult(
                    rank: driverJson['rank'],
                    points: driverJson['points'],
                    teamName: driverJson['firstname'],
                    drivers: driverJson['drivers'],
                  );

                  teams.add(instance);
                }
              }
            }
          }
        }
      }
    }
    return true;
  }
}
