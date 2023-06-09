import 'package:f1_api/constants.dart';
import 'package:f1_api/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/f1_provider.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    F1Provider providerTeam = Provider.of<F1Provider>(context);
    
    final args = ModalRoute.of(context)!.settings.arguments as WidgetArguments;
    final name = args.name.toLowerCase().replaceAll(' ', '');

    return FutureBuilder(
      //TODO: CAMBIAR
      future: providerTeam.getDriver(name),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: const Text(
                'Driver',
                style: TextStyle(fontFamily: 'F1', color: Colors.white),
              )
            ),
            body: Container(
              color: Colors.black12 ,
              child: Column(
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
                                  // TODO:CAMBIAR 
                                  providerTeam.currentDriver!.team!,
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
                        Image.asset('assets/${args.firstName}.png'),
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 25,
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
                              // color: Colors.black26,
                              color: Colors.black26,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //TODO: CAMBIAR TODO ESTO 
                                      DriverDetails(
                                        title: 'Points',
                                        datail: providerTeam.currentDriver!.points!
                                      ),
                                      DriverDetails(
                                        title: 'World Championships',
                                        datail: providerTeam.currentDriver!.worldChampionships!
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DriverDetails(
                                        title: 'Podiums',
                                        datail: providerTeam.currentDriver!.podiums!
                                      ),
                                      DriverDetails(
                                        title: 'Races',
                                        datail: providerTeam.currentDriver!.grandsPrixEntered!
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DriverDetails(
                                        title: 'Country',
                                        datail: providerTeam.currentDriver!.country!
                                      ),
                                      DriverDetails(
                                        title: 'Date of Birth',
                                        datail: providerTeam.currentDriver!.dateOfBirth!
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
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Card(
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Biography', 
                                      style: TextStyle(
                                      fontFamily: 'F1B', color: Colors.black
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                  Text('Velit veniam anim commodo minim sit tempor reprehenderit eu pariatur id ut. Consequat consequat pariatur ea in fugiat in enim pariatur non culpa consectetur. Culpa pariatur deserunt elit do cillum esse anim. Esse proident fugiat dolore ut non dolor deserunt labore non sit in nostrud ipsum fugiat. Esse ipsum excepteur exercitation enim sit minim consectetur velit sit voluptate duis duis Lorem. \n\nEsse elit qui magna in exercitation. Sint ullamco mollit adipisicing non dolor non Lorem veniam. Pariatur fugiat esse ullamco aliqua Lorem ad voluptate commodo aute. Ad culpa eu ullamco Lorem eiusmod ea exercitation laboris. Nisi ea in irure deserunt ut aute duis sunt sint enim officia. Minim aute labore non irure labore cillum.Enim consequat non ea culpa id magna esse laboris dolor eiusmod. Fugiat et in ad ea pariatur officia magna et ea dolore qui dolore duis. Minim cupidatat ad sint proident laboris amet. Veniam et sunt et Lorem velit voluptate anim non pariatur non dolor fugiat consectetur officia. Qui sit veniam amet proident ullamco cillum occaecat culpa ad. In cillum ut dolore fugiat.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.black
                                    ),
                                  ),
                                  Text('Velit veniam anim commodo minim sit tempor reprehenderit eu pariatur id ut. Consequat consequat pariatur ea in fugiat in enim pariatur non culpa consectetur. Culpa pariatur deserunt elit do cillum esse anim. Esse proident fugiat dolore ut non dolor deserunt labore non sit in nostrud ipsum fugiat. Esse ipsum excepteur exercitation enim sit minim consectetur velit sit voluptate duis duis Lorem. \n\nEsse elit qui magna in exercitation. Sint ullamco mollit adipisicing non dolor non Lorem veniam. Pariatur fugiat esse ullamco aliqua Lorem ad voluptate commodo aute. Ad culpa eu ullamco Lorem eiusmod ea exercitation laboris. Nisi ea in irure deserunt ut aute duis sunt sint enim officia. Minim aute labore non irure labore cillum.Enim consequat non ea culpa id magna esse laboris dolor eiusmod. Fugiat et in ad ea pariatur officia magna et ea dolore qui dolore duis. Minim cupidatat ad sint proident laboris amet. Veniam et sunt et Lorem velit voluptate anim non pariatur non dolor fugiat consectetur officia. Qui sit veniam amet proident ullamco cillum occaecat culpa ad. In cillum ut dolore fugiat.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.black
                                    ),  
                                  ),
                                    
                              
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          );
        }
      } 
    );
  }
}

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key, required this.title, required this.datail});

  final String title;
  final String datail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .40,
      child: Card(
        //surfaceTintColor: Colors.amber,
        elevation: 30,
        color: Colors.white,
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
