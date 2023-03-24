
import 'package:f1_api/providers/f1_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../router/app_routes.dart';

const itemSize2 = 120.0;

class TeamView extends StatefulWidget {
  const TeamView({super.key});

  @override
  State<TeamView> createState() => _teamsViewState();
}

class _teamsViewState extends State<TeamView> {
  final scrollController = ScrollController();

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    F1Provider providerTeam = Provider.of<F1Provider>(context);

    //TODO: Cambiar los teams

    return FutureBuilder(
      future:providerTeam.getTeams(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(1),
            child: ListView.builder(
              controller: scrollController,
              itemCount:providerTeam.teams.length ,
              itemBuilder: (BuildContext context, int index) {

                 final itemPositionOffset = index * (itemSize2 + 8);
                  final difference = scrollController.offset - itemPositionOffset;
                  final percent = 1 -(difference / itemSize2);
                  double oppacity = percent;
                  double scale = percent;
          
                  if(oppacity > 1.0) oppacity = 1.0;
                  if(oppacity < 0.0) oppacity = 0.0;
                  if(percent > 1.0) scale = 1.0;
                  if(index >= 14 ) scale = 1.0;
                  if(index >= 14 ) oppacity = 1.0;

                return  TeamCard(
                     oppacity: oppacity, scale: scale, team: providerTeam.teams[index], index: index);
              },
            ),
            
            
            
            
          );
        }
      },
    );
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.oppacity,
    required this.scale,
    required this.team,
    required this.index,
  });

  final double oppacity;
  final double scale;
  final TeamsResult team;
  final int index;

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    //print('assets/${team.drivers![0]['lastname']}.png'.replaceAll(' ', ''));

    return Align(
      child: Opacity(
        opacity: oppacity,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(scale, scale),
          child: Column(children: [
            GestureDetector(
              //TODO: CAMBIAR
              onTap: () {
                // Navigator.pushNamed(
                //   context, menuOptions[0].route,
                //   arguments: WidgetArguments2(index, '${team.teamName}', team.rank!['standing']!.toString())
                // );
              },
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                color: Colors.black54,
                child: SizedBox(
                  height: itemSize2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 60,
                              //color: Colors.amber,
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  fontFamily: 'F1', color: Colors.white, fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 4,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${team.teamName}',
                              style: const TextStyle(
                                fontFamily: 'F1', color: Colors.white, fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset('assets/${team.drivers![0]['lastname']}.png'.replaceAll(' ', ''))
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${team.drivers![0]['lastname']}',
                                  style: const TextStyle(
                                    fontFamily: 'F1R', color: Colors.white, fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset('assets/${team.drivers![1]['lastname']}.png'.replaceAll(' ', ''))
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${team.drivers![1]['lastname']}',
                                  style: const TextStyle(
                                    fontFamily: 'F1R', color: Colors.white, fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          width: 100,
                          height: 80,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: AlignmentDirectional.center,
                            children: [
                              Image.asset('assets/${team.teamName}.jpeg'.toLowerCase().replaceAll(' ', '')),       
                              Positioned(
                                bottom: -20,
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                    child: Text(
                                      '${team.points!['pts']} pts',
                                      style: const TextStyle(
                                        fontFamily: 'F1R', color: Colors.black, fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
