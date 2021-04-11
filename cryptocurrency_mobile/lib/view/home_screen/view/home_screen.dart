import 'package:cryptocurrency_mobile/view/home_screen/viewmodel/home_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {
  final _viewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButtonConnectApi(),
      body: buildBody(),
    );
  }

  Center buildBody() {
    return Center(
      child: Observer(builder: (_) {
        switch (_viewModel.pageState) {
          case PageState.LOADING:
            return CircularProgressIndicator();
          case PageState.SUCCESS:
            return buildGridViewBuilder();
          case PageState.ERROR:
            return Text('NETWORK CONNECTION ERROR!');
          default:
            return FlutterLogo();
        }
      }),
    );
  }

  GridView buildGridViewBuilder() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: _viewModel.buttons.length,
      itemBuilder: (context, index) => buildCardButtons(index),
    );
  }

  Card buildCardButtons(int index) {
    return Card(
      child: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Text(
            _viewModel.buttons[index].name,
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  FloatingActionButton buildFloatingActionButtonConnectApi() {
    return FloatingActionButton(
      onPressed: () {
        _viewModel.getAllPost2();
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('DESXZ'),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(builder: (_) {
          return Visibility(
            visible: _viewModel.isServiceRequestLoading,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        }),
      ),
    );
  }
}
