import 'package:f1_api/api/f1_api.dart';
import 'package:f1_api/models/drivers_model.dart';
import 'package:flutter/material.dart';

import '../router/app_routes.dart';

const itemSize = 120.0;

class DriversView extends StatefulWidget {
   
  const DriversView({super.key});

  @override
  State<DriversView> createState() => _DriversViewState();
}

class _DriversViewState extends State<DriversView> {

  final scrollController = ScrollController();

  void onListen(){
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
    final menuOptions = AppRoutes.menuOptions;
    //TODO: Cambiar los drivers
    final api =  F1Api(
    baseUrl: 'https://fia-formula-1-championship-statistics.p.rapidapi.com', 
    apiKey: 'ad0474a17cmsh8434c481c1a8b79p1d25b9jsn0e6d3ad825a2');
    
    final futureDrivers = api.getDrivers();
    
    return FutureBuilder(
      future: futureDrivers,
      builder: (context, snapshot) {

        if(snapshot.connectionState != ConnectionState.done)
        {return const CircularProgressIndicator();}


        return Padding(
        padding: const EdgeInsets.all(12),
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index){

                  final driver = snapshot.data![index];

                  final itemPositionOffset = index * itemSize;
                  final difference = scrollController.offset - itemPositionOffset;
                  final percent = 1 -(difference / itemSize);
                  double oppacity = percent;
                  double scale = percent;
          
                  if(oppacity > 1.0) oppacity = 1.0;
                  if(oppacity < 0.0) oppacity = 0.0;
                  if(percent > 1.0) scale = 1.0;
                  //TODO: Cambiar el numero del index
                  if(index >= 3 ) scale = 1.0;
                  if(index >= 3 ) oppacity = 1.0;
          
                  return CarDriver(oppacity: oppacity, scale: scale, driver: driver);
                }, 
                childCount: snapshot.data?.length
              )
            )
          ],
        ),
      );
      },
    );
  }
}

class CarDriver extends StatelessWidget {
  const CarDriver({
    super.key,
    required this.oppacity,
    required this.scale,
    required this.driver,
  });

  final double oppacity;
  final double scale;
  final DriversResult driver;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Opacity(
        opacity: oppacity,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(scale, scale),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  //Navigator.pushNamed(context, menuOptions[0].route, arguments: WidgetArguments(index));
                },
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20)
                    )
                  ),
                  color: const Color.fromARGB(255, 11, 26, 39),
                  // TODO: Cambiar el color 
                  child: SizedBox(
                    height: itemSize,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                        Image.asset('assets/Max.png'),
                        Column(
                          children: const [
                            Text(
                              'no',
                              style: TextStyle(
                                fontFamily: 'F1',
                                color: Colors.white
                              ),
                            ),
                            Text(
                              'Hola',
                              style: TextStyle(
                                fontFamily: 'F1R',
                                color: Colors.white
                              ),
                            ),
                          ],
                        )
                        
                      ],
                    ),
                  )
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}