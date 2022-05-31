import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../repositories/data_repositoy.dart';
import '../../shared/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  //Données externes
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Données internes
  //List<Movie>? movies= [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);

    return Scaffold(
      backgroundColor: dylosamBackground,
      appBar: AppBar(
        backgroundColor: dylosamBackground,
        leading: Image.asset(
          "assets/images/logo.png",
        ),
      ),
      body: ListView(
        children: [
          Container(
              height: 621,
              //color: ksiPrimaryColor,
              child: dataProvider.popularMovieList.isEmpty
                  ? const Center(
                      child: Text("Indisponibilité du film"),
                    )
                  : Image.network(
                      dataProvider.popularMovieList[2].posterUrl(),
                      fit: BoxFit.cover,
                    )),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Tendances Actuelles",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) => Container(
                  width: 125,
                  margin: const EdgeInsets.only(right: 10),
                  //color:  Colors.amber,
                  child: dataProvider.popularMovieList.isEmpty
                      ? const Center(
                          child: Text("Indisponibilité du film"),
                        )
                      : Image.network(
                          dataProvider.popularMovieList[index].posterUrl(),
                          fit: BoxFit.cover,
                        ))),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Actuellement au cinéma",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 375,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                    width: 250,
                    margin: EdgeInsets.only(right: 5),
                    color: Colors.green,
                    child: dataProvider.popularMovieList.isEmpty
                        ? const Center(
                            child: Text("Indisponibilité du film"),
                          )
                        : Image.network(
                            dataProvider.popularMovieList[index].posterUrl(),
                            fit: BoxFit.cover,
                          ))),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Ils arrivent bientôt....",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                    width: 125,
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.blueAccent,
                    child: dataProvider.popularMovieList.isEmpty
                        ? const Center(
                            child: Text("Indisponibilité du film"),
                          )
                        : Image.network(
                            dataProvider.popularMovieList[index + 10]
                                .posterUrl(),
                            fit: BoxFit.cover,
                          ))),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Annimation",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                    width: 125,
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.yellowAccent,
                    child: dataProvider.popularMovieList.isEmpty
                        ? const Center(
                            child: Text("Indisponibilité du film"),
                          )
                        : Image.network(
                            dataProvider.popularMovieList[index + 8]
                                .posterUrl(),
                            fit: BoxFit.cover,
                          ))),
          )
        ],
      ),
    );
  }
}
