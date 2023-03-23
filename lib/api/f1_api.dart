import 'package:dio/dio.dart';
import 'package:f1_api/models/models.dart';


class F1Api {
  F1Api({
    required this.baseUrl,
    required this.apiKey,
    this.rapidApiHost = 'fia-formula-1-championship-statistics.p.rapidapi.com',
    this.connectTimeout = const Duration(seconds: 15),
    this.receiveTimeout = const Duration(seconds: 15),
  }) : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
          headers: {
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': rapidApiHost,
          },
        ));

  final Dio dio;
  final String baseUrl;
  final String rapidApiHost;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final String apiKey;

  Future<DriverResult?> getDriver(String driverName) async {
    final response =
        await dio.get<Map<String, dynamic>>('/api/drivers/details/$driverName');

    late DriverResult result;

    if (response.data != null) {
      final data = response.data;

      if (data?.containsKey('driverDetails') ?? false) {
        final content = data?['driverDetails'];

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

          result = instance;
        }
      }
    }
    return result;
  }

  Future<List<DriversResult>?> getDrivers() async {
    final response = await dio.get<Map<String, dynamic>>('/api/drivers');

    final result = <DriversResult>[];

    if (response.data != null) {
      final data = response.data;

      if (data?.containsKey('drivers') ?? false) {
        final content = data?['drivers'];

        if (content is List<dynamic>?) {
          final driversList = content;

          if (driversList != null && driversList.isNotEmpty) {
            for (final driverData in driversList) {
              if (driverData is Map<String, dynamic>) {
                final driverJson = driverData;

                final instance = DriversResult(
                  rank: driverJson['rank'],
                  points: driverJson['points'] ,
                  firstname: driverJson['firstname'],
                  lastname: driverJson['lastname'],
                  abbr: driverJson['abbr'],
                );

                result.add(instance);
              }
            }
          }
        }
      }
      return result;
    }
    return null;
  }

  Future<List<TeamsResult>?> getTeams() async {
    final result = <TeamsResult>[];
    if (result.isEmpty) {
      final response = await dio.get<Map<String, dynamic>>('/api/teams');
      //final response = await Api.httpGet('/api/teams');

      //await Future.delayed(const Duration(seconds: 2));

      if (response.data != null) {
        final data = response.data;

        if (data?.containsKey('teams') ?? false) {
          final content = data?['teams'];

          if (content is List<dynamic>?) {
            final teamsList = content;

            if (teamsList != null && teamsList.isNotEmpty) {
              for (final teamData in teamsList) {
                if (teamData is Map<String, dynamic>) {
                  final driverJson = teamData;

                  final instance = TeamsResult(
                    rank: driverJson['rank'],
                    points: driverJson['points'],
                    teamName: driverJson['teamName'],
                    drivers: driverJson['drivers'],
                  );

                  result.add(instance);
                }
              }
            }
          }
        }
        return result;
      }
    }
    return null;
  }
}
