import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/asset_util.dart';


class ProfilePage extends GetView {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Challenge 01',
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 16.0,
                        backgroundImage: AssetImage(GMAsset.profileAvatar),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      CircleAvatar(
                        radius: 16.0,
                        backgroundImage: AssetImage(GMAsset.profileEdit),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                      radius: 44.0,
                      backgroundImage: AssetImage(GMAsset.profileAvatar)),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'UserName',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '@test_account',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Latest Followers',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            radius: 15.0,
                            backgroundImage: AssetImage(GMAsset.profileAvatar)),
                        CircleAvatar(
                            radius: 15.0,
                            backgroundImage: AssetImage(GMAsset.profileAvatar)),
                        CircleAvatar(
                            radius: 15.0,
                            backgroundImage: AssetImage(GMAsset.profileAvatar)),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: const ListTile(
                            title: Text(
                              'Followers',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            subtitle: Text(
                              '5000',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: const ListTile(
                            title: Text(
                              'Following',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            subtitle: Text(
                              '5000',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

