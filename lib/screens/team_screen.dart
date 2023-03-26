import 'package:f1_api/constants.dart';
import 'package:f1_api/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/f1_provider.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    F1Provider providerTeam = Provider.of<F1Provider>(context);
    
    final args = ModalRoute.of(context)!.settings.arguments as WidgetArguments2;
    final name = args.name.toLowerCase().replaceAll(' ', '');

    return FutureBuilder(
      future: providerTeam.getTeam(name),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: const Text(
                'Team',
                style: TextStyle(fontFamily: 'F1', color: Colors.white),
              )
            ),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(kDefaultPadding * 2),
                      bottomLeft: Radius.circular(kDefaultPadding * 2),
                    )
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            args.name,
                            style: const TextStyle(
                              fontFamily: 'F1B', color: Colors.white, fontSize: 25
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                            width: 250,
                            child: Divider(
                              color: Colors.white,
                              thickness: 0.5,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                args.rank,
                                style: const TextStyle(
                                  fontFamily: 'F1R', color: Colors.white, fontSize: 20
                                ),
                              ),
                              const SizedBox(
                                width: 30, 
                              ),
                              Text(
                                (providerTeam.currentTeam?.points).toString(),
                                style: const TextStyle(
                                  fontFamily: 'F1R', color: Colors.white, fontSize: 20
                                ),
                              ),
                            ],
                          )
                        ]
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset('assets/$name.jpeg')
                      ),
                    ]
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            color: Colors.black26,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TeamDetails(
                                      title: 'Team Chief',
                                      datail: providerTeam.currentTeam!.teamChief!
                                    ),
                                    TeamDetails(
                                      title: 'Technical Chief',
                                      datail: providerTeam.currentTeam!.technicalChief!
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TeamDetails(
                                      title: 'World Championships',
                                      datail: providerTeam.currentTeam!.worldChampionships!
                                    ),
                                    TeamDetails(
                                      title: 'Pole Positions',
                                      datail: providerTeam.currentTeam!.polePositions!
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TeamDetails(
                                      title: 'Chassis',
                                      datail: providerTeam.currentTeam!.chassis!
                                    ),
                                    TeamDetails(
                                      title: 'Power unit',
                                      datail: providerTeam.currentTeam!.powerUnit!
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Card(
                            color: const Color.fromARGB(255, 254, 252, 252),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Drivers',
                                  style: TextStyle(
                                    fontFamily: 'F1B', color: Colors.black, fontSize: 18
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Card(
                                        color: Colors.black87,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              Image.asset('assets/${providerTeam.currentTeam!.drivers![0]['firstname']}.png'.replaceAll(' ', '')),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                providerTeam.currentTeam!.drivers![0]['firstname'],
                                                style: const TextStyle(
                                                  fontFamily: 'F1B', color: Colors.white, fontSize: 18
                                                ),
                                              ),
                                              Text(
                                                providerTeam.currentTeam!.drivers![0]['lastname'],
                                                style: const TextStyle(
                                                  fontFamily: 'F1', color: Colors.white, fontSize: 15
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        )
                                      ),
                                      // const SizedBox(
                                      //   width: 50,
                                      // ),
                                      Card(
                                        color: Colors.black87,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              Image.asset('assets/${providerTeam.currentTeam!.drivers![1]['firstname']}.png'.replaceAll(' ', '')),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                providerTeam.currentTeam!.drivers![1]['firstname'],
                                                style: const TextStyle(
                                                  fontFamily: 'F1B', color: Colors.white, fontSize: 18
                                                ),
                                              ),
                                              Text(
                                                providerTeam.currentTeam!.drivers![1]['lastname'],
                                                style: const TextStyle(
                                                  fontFamily: 'F1', color: Colors.white, fontSize: 15
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        )
                                      )
                                    ],
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          );
        }
      } 
    );
  }
}

class TeamDetails extends StatelessWidget {
  const TeamDetails({super.key, required this.title, required this.datail});

  final String title;
  final String datail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .40,
      child: Card(
        //surfaceTintColor: Colors.amber,
        elevation: 10,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical:8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'F1B', color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    datail,
                    style: const TextStyle(
                      fontFamily: 'F1R', color: Colors.black
                    ),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 3,
                  //   child: const Divider(
                  //     thickness: 1.0,
                  //   ),
                  // )
                ]
              ),
              //const Icon(Icons.numbers_rounded, color: Colors.black,),
            ],
          ),
        ),
      ),
    );
  }
}
