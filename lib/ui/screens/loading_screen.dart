import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_app/repositories/data_repositoy.dart';
import 'package:netflix_app/shared/constants.dart';
import 'package:netflix_app/ui/screens/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Void initState() {
    //TODO
    super.initState();
    InitData();
  }

  Future<void> initData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    await dataProvider.initData();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return HomeScreen()
    }(builder))
  }

  Widget build(BuildContext context) {
    return Container(
      color: dylosamBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/netflix_logo_2"),
          const SpinKitFadingCircle(color: dylosamPrimaryColor, size: 50),
        ],
      ),
    );
  }
}
