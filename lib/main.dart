// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: const MyApp(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'lato',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'monster',
              fontSize: 24,
              fontWeight: FontWeight.w900),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Welcome back!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey[200]!,
                offset: Offset.zero,
                blurRadius: 0.0,
                spreadRadius: 0.0)
          ], borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Crop protection'),
                ],
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('companies')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container();
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) => ListItem(
                            snapshot.data!.docs[index].data()['name'],
                            1,
                            snapshot.data!.docs[index].id));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem(this.name, this.count, this.id, {key}) : super(key: key);
  final String name;
  final int count;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => CompanyPage(id, name))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/en/thumb/b/b9/UPL_official_logo.svg/1200px-UPL_official_logo.svg.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(
                    '$count products',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem1 extends StatelessWidget {
  const ListItem1(this.name, this.count, this.id, this.company, {key}) : super(key: key);
  final String company;
  final String name;
  final int count;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProductsList(id, name, company))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/en/thumb/b/b9/UPL_official_logo.svg/1200px-UPL_official_logo.svg.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(
                    '$count products',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem2 extends StatelessWidget {
  const ListItem2(this.name, this.count, this.id, {key}) : super(key: key);
  final String name;
  final int count;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/en/thumb/b/b9/UPL_official_logo.svg/1200px-UPL_official_logo.svg.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(
                    '$count products',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CompanyPage extends StatelessWidget {
  const CompanyPage(this.id, this.name, {Key? key}) : super(key: key);
  final String name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey[200]!,
                offset: Offset.zero,
                blurRadius: 0.0,
                spreadRadius: 0.0)
          ], borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Crop protection > $name'),
                ],
              ),
              ListItem1('Herbicides', 3, id, name),
              ListItem1('Fungicides', 1, id, name),
              ListItem1('Insecticides', 1, id, name),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList(this.id, this.name, this.company, {Key? key}) : super(key: key);
  final String id;
  final String name;
  final String company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey[200]!,
                offset: Offset.zero,
                blurRadius: 0.0,
                spreadRadius: 0.0)
          ], borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Crop protection > $company > $name'),
                ],
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection(name.toLowerCase())
                      .where('company', isEqualTo: id)
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                        height: 58,
                        width: 58,
                        color: Colors.black,
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) => ListItem2(
                        snapshot.data!.docs[index].data()['name'],1,
                        id,
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
