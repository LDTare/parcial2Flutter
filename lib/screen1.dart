import 'package:flutter/material.dart';

//Estilo de la primera fila de cards
class CardItem {
  final String urlImage;
  final String title;
  final String subtitle;
  const CardItem(
      {
        required this.urlImage, 
        required this.title, 
        required this.subtitle});
}

//Estilo de la segunda fila de cards
class CardItem2 {
  final String urlImage;
  final String title;
  final String time;
  final String price;
  const CardItem2(
      {
        required this.urlImage,
        required this.title,
        required this.time,
        required this.price});
}

class PantallaParcial extends StatefulWidget {
  const PantallaParcial({Key? key}) : super(key: key);
  @override
  State<PantallaParcial> createState() => _ObjetosScreen();
}

class _ObjetosScreen extends State<PantallaParcial> {
  
  List<CardItem> items = [
    const CardItem(
        urlImage: 'assets/images/tikal.jpg',
        title: 'Tikal',
        subtitle: 'Civilizacion maya, en su maxima expresion'),
    const CardItem(
        urlImage: 'assets/images/atitlan.jpg',
        title: 'Atitlan',
        subtitle: 'El lago mas hermoso del mundo'),
    const CardItem(
        urlImage: 'assets/images/semuc.jpeg',
        title: 'Semuc',
        subtitle: 'Un paraiso natural en medio del bosque'),
    const CardItem(
        urlImage: 'assets/images/xela.jpg',
        title: 'Xela',
        subtitle: 'La cuna de la cultura y de los mejores ingenieros'),
  ];

  List<CardItem2> items2 = [
    const CardItem2(
        urlImage: 'assets/images/imagen4.jpg',
        title: '''Volcan Tajumulco''',
        time: '2 dias',
        price: 'Q. 325'),
    const CardItem2(
        urlImage: 'assets/images/imagen1.jpg',
        title: '''Cultura en el altiplano''',
        time: '2 dias',
        price: 'Q. 325'),
    const CardItem2(
        urlImage: 'assets/images/imagen2.jpg',
        title: '''Camping Tecpan''',
        time: '2 dias',
        price: 'Q. 325'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Container(
                margin: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'Guatemala',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  'Corazón del mundo maya',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w200
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              
              SizedBox(
                height: 280,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: ((context, _) => const SizedBox(
                        width: 12,
                      )),
                  itemBuilder: (context, index) =>
                      buildCard(item: items[index], context: context)),

              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),

              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  'Actividades',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child:  ListView.separated(
                  padding: const EdgeInsets.all(16),
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  separatorBuilder: ((context, _) => const SizedBox(
                        width: 12,
                      )),
                  itemBuilder: (context, index) =>
                      buildCard2(item: items2[index], context: context)),
              ),

            ],
          ),
        ),
    ) ;
  }
}

Widget buildCard({required CardItem item, required BuildContext context}) =>
    Container(
      width: 150,
      height: 270,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(item.urlImage)),
         border: Border.all(
          color: Colors.transparent
         ),
         borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
         const SizedBox(
          height: 145,
         ),

         Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 35, 
              color: Colors.white
              ),
            textAlign: TextAlign.right,
          ),
         ),

         Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          child: Text(
            item.subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white
              ),
            textAlign: TextAlign.left,
          ),
         ),
        ],
      ),
    );

Widget buildCard2({required CardItem2 item, required BuildContext context}) =>
    Container(
      width: 500,
      height: 100,
      margin: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(item.urlImage)),
        border: Border.all(
          color: Colors.transparent
         ),
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),

       child:  Row(
         children: <Widget>[
               Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: 150,
                  child: Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600, 
                          color: Colors.white,  
                          fontSize: 22
                          ),
                    ),
                  ), 

                   const Flexible(fit: FlexFit.tight, child: SizedBox()),
                   
                   Container(
                    margin: const EdgeInsets.only(right:10 ,top: 25),
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Text(
                      item.time,
                      style: Theme.of(context).textTheme.labelSmall ?.copyWith(
                          fontWeight: FontWeight.w600, 
                          color: Colors.white,  
                          fontSize: 15  
                          ),
                        textAlign: TextAlign.right,
                    ),

                    Text(
                      item.price,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600, 
                          color: Colors.white,  
                          fontSize: 20
                          ),
                        textAlign: TextAlign.right,
                    ),
                  ],)
                  ),

                  

            ],
       )
    );
