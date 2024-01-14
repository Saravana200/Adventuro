import 'package:flutter/material.dart';
import 'package:travelgod/screenComponents/ScreenSize.dart';
import 'package:url_launcher/url_launcher.dart';

import 'CurrencyData/Currency.dart';
import 'MoneyConvert.dart';
import 'datatypes/data.dart';

class PlacesView extends StatefulWidget {
   PlacesView({required this.res,Key? key}) : super(key: key);

  Places res;

  @override
  State<PlacesView> createState() => _PlacesViewState();
}

class _PlacesViewState extends State<PlacesView> {

  String? budget;

  void getAmounts() async {
    var usdConvert = await MoneyConvert.convert(
        Currency(Currency.INR, amount: 1), Currency(Currency.USD));
    setState(() {
      if(usdConvert!=null){
        budget = usdConvert.toStringAsFixed(2);
      }
      else{
        budget = "ERROR";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Recommneded places!'),
      ),
        body: ListView.builder(
          itemCount: widget.res.places.length,
          itemBuilder: (context, index) {
            var chu=widget.res.places[index];
            print(chu.price);
          return buildCard(chu.location.name,chu.price,chu.image_url,chu.description.length>34?chu.description:"",chu.location.position.latitude,chu.location.position.longitude);
          },
        ));
  }
}
Future<void> openGoogleMaps(double latitude, double longitude) async {
  Uri googleMapsUrl = Uri(scheme: 'http://www.google.com/maps/search/?query=$latitude,$longitude');

  if (await canLaunchUrl(googleMapsUrl)) {
    await launchUrl(googleMapsUrl);
  } else {
    throw 'Could not launch Google Maps';
  }
}



Card buildCard(head,sub,url,supp,lati,longi) {
  var heading = head;
  var subheading = sub;
  var cardImage = NetworkImage(url);
  var supportingText = supp;
  var lat = lati;
  var long = longi;
  bool _isnull = false;
  if(lat==null||long==null){
    _isnull = true;
  }
  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(heading),
            subtitle: Row(
              children: [
                Text(subheading),
                IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.arrow_right)
                )
              ],
            ),
            trailing: Icon(Icons.favorite_outline),
          ),
          Container(
            height: getProportionateScreenHeight(200),
            child: Ink.image(
              image: cardImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('CONTACT AGENT'),
                onPressed: () {/* ... */},
              ),
              TextButton(
                child: const Text('OPEN MAPS'),
                onPressed: () {
                  if(!_isnull){
                    openGoogleMaps(lat,long);
                  }
                },
              )
            ],
          )
        ],
      ));
}


