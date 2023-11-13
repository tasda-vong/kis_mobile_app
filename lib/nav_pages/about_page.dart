import 'dart:html';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:kis_app/drawer_menu.dart';
import 'package:kis_app/gMapsHtml.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

AppBar _MyOwnAppBar(String sTitle) {
  return AppBar(
    backgroundColor: Colors.blue[900],
    toolbarHeight: 50,
    title: Text(sTitle),
  );
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'KhBat'),
      home: Scaffold(
        appBar: _MyOwnAppBar('អំពីសាលា'),
        drawer: MyDrawer(),
        body: _buildbody,
      ),
    );

    // Generated code for this Column Widget...
  }

  Widget get _buildbody {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Container(child: _logo),
          Container(child: _address),
          Container(child: _contactnumber),
          Container(child: _email),
          Container(child: _gmap)
        ],
      ),
    );
  }

  Widget get _logo {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/logo_small.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Text(
            'សាលាកុលបុត្រអន្តរជាតិ',
            style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlue.shade900,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            'KOLLABOT INTERNATIONAL SCHOOL (KIS)',
            style: TextStyle(
                fontSize: 15,
                color: Colors.red.shade900,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget get _gmap {
    return Card(
      color: Colors.amber.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "ផែនទី",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: GMapsHtml(
                  url:
                      "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3886.1163347076363!2d103.18685827407022!3d13.091812912233364!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3105493dc3b12ee3%3A0xf19dfdf87a27d20e!2z4Z6f4Z624Z6b4Z624Z6A4Z674Z6b4Z6U4Z674Z6P4Z-S4Z6a4Z6i4Z6T4Z-S4Z6K4Z6a4Z6H4Z624Z6P4Z63IC0gS29sbGFib3QgSW50ZXJuYXRpb25hbCBTY2hvb2w!5e0!3m2!1sen!2skh!4v1686020896281!5m2!1sen!2skh"),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _fbpage {
    String fbProtocolUrl;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      fbProtocolUrl = 'fb://profile/107208161575133';
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      fbProtocolUrl = 'fb://page/107208161575133';
    } else {
      fbProtocolUrl =
          'https://www.facebook.com/kollabot.internationalschool.edu';
    }
    print(fbProtocolUrl);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
          alignment: Alignment.center,
          height: 120,
          width: 400,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(text: "Facebook Page "),
            TextSpan(
                text: fbProtocolUrl,
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    var fb_url = Uri.parse(fbProtocolUrl);

                    launchUrl(fb_url);
                    // "https://www.facebook.com/kollabot.internationalschool.edu";
                    // if (await canLaunch(url)) {
                    //    await launch(url);
                    //   } else {
                    //     throw 'Could not launch $url';
                    //    }
                  }),
          ]))),
    );
  }

  Widget get _address {
    return Card(
      color: Colors.amber.shade100,
      child: ListTile(
        title: Text(
          "អាសយដ្ឋាន",
          style: TextStyle(
              fontSize: 15,
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
        subtitle: Text(
          'ផ្លូវលេខ ៤១៣ ភូមិអូរតាគាំ១ សង្កាត់ទួលតាឯក ក្រុងបាត់ដំបង',
          style: TextStyle(fontSize: 15, color: Colors.blue.shade900),
        ),
      ),
    );
  }

  Widget get _contactnumber {
    return Card(
      color: Colors.amber.shade100,
      child: ListTile(
        title: Text(
          "លេខទូរស័ព្ទទំនាក់ទំនង ឬ តេលេក្រាម",
          style: TextStyle(
              fontSize: 15,
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
        subtitle: Text(
          '070 227 700 / 078 227 700',
          style: TextStyle(fontSize: 15, color: Colors.blue.shade900),
        ),
      ),
    );
  }

  Widget get _email {
    return Card(
      color: Colors.amber.shade100,
      child: ListTile(
        title: Text(
          "អ៊ីមែល",
          style: TextStyle(
              fontSize: 15,
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
        subtitle: Text(
          'kollabot.internationalschool@gmail.com',
          style: TextStyle(fontSize: 15, color: Colors.blue.shade900),
        ),
      ),
    );
  }

  Widget get _description {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "អាសយដ្ឋាន",
          style: TextStyle(
              fontSize: 15,
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 0, bottom: 10),
          child: Text(
            '070 227 700 / 078 227 700',
            style: TextStyle(fontSize: 15, color: Colors.blue.shade900),
          ),
        ),
        Text(
          "លេខទូរស័ព្ទទំនាក់ទំនង ឬ តេលេក្រាម",
          style: TextStyle(
              fontSize: 15,
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 0, bottom: 10),
          child: Text(
            "070 227 700 / 078 227 700",
            style: TextStyle(fontSize: 15, color: Colors.blue.shade900),
          ),
        ),
        Text(
          "អ៊ីមែល",
          style: TextStyle(
              fontSize: 15,
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "kollabot.internationalschool@gmail.com",
            style: TextStyle(fontSize: 15, color: Colors.blue.shade900),
          ),
        ),
      ],
    );
  }
}
