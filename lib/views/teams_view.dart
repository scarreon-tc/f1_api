
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

    return Align(
      child: Opacity(
        opacity: oppacity,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(scale, scale),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //   context, menuOptions[0].route,
                //   arguments: WidgetArguments2(index, '${team.teamName}', team.rank!.toString())
                // );
              },
              child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
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
                                height: 40,
                                width: 6,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: 280,
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
                              Text(
                                '${team.teamName}'.toUpperCase(),
                                style: const TextStyle(
                                  fontFamily: 'F1', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            //Image.asset('assets/${team.teamName}.png'),       
                            Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                child: Text(
                                  '${team.points} pts',
                                  style: const TextStyle(
                                    fontFamily: 'F1R', color: Colors.black, fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
