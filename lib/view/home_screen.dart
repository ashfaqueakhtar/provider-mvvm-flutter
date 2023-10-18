import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/response/status.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view_model/home_view_model.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userViewModel.removeUser().then((value) {
                context.go("/login");
              });
            },
            child: const Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text("Logout"))),
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            switch (value.movieList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Text(value.movieList.message.toString());
              case Status.COMPLETED:
                return Text("YAAAY!");
              case Status.DOWNLOADING:
                break;
            }
            return Container();
          },
        ),
      ),
    );
  }
}
