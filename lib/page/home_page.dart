import 'package:flutter/material.dart';
import 'package:makanan_app/model/response_filter.dart';
import 'package:makanan_app/network/net_client.dart';
import 'package:makanan_app/page/favouritee_page.dart';
import 'package:makanan_app/ui/list_meals.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  ResponseFilter? responseFilter;
  bool isLoading = true;

  void fetchDataMeals() async {
    try {
      NetClient client = NetClient();
      var data = await client.fetchDataMeals(currentIndex);
      setState(() {
        responseFilter = data;
        isLoading = false;
      });
    }catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataMeals();
  }

  Widget build(BuildContext context) {
    var listNav = [listMeals(responseFilter), listMeals(responseFilter)];
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            FavouritePage(indexNav: currentIndex)
            ));
          },
          icon: Icon(Icons.favorite_outline),
          )
        ],
      ),
      body: Center(
        child: isLoading == false ? listNav[currentIndex] : CircularProgressIndicator(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlue,
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Seafood"),
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Dessert"),
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
          fetchDataMeals();
        },
      ),
    );
  }
}
