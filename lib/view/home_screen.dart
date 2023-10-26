import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/response/status.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/routes/routes_names.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("HOME: Main Build called");
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userViewModel.removeUser().then((value) {
                GoRouter.of(context).pushReplacementNamed(RoutesName.login);
              });
            },
            child: const Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text("Logout"))),
          ),
        ],
      ),
      body: Column(children: [
        TextButton(onPressed: (){
          homeViewModel.fetchNameList();
        }, child: Text("Load")),
        Consumer<HomeViewModel>(
          builder: (context, value, child) {
            print("HOME: Consumer called");
            print("HOME: ${value.colorNameList.status}");
            switch (value.colorNameList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Text(value.colorNameList.message.toString());
              case Status.COMPLETED:
                return Text("YAAAY!");
              case Status.DOWNLOADING:
                break;
            }
            return Container();
          },
        ),
      ],),
    );
  }
}
