import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_model.dart';
import 'SecondScreen.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with AutomaticKeepAliveClientMixin {
  // const FirstScreen({super.key});
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      endDrawer: _buildEndDrawer(),
      body: _buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _buildFloating(),
      //bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      //leading: Icon(Icons.face),
      title: Text(
        "កម្មវិធីម្ហូបអាហារ",
        style: GoogleFonts.moul(fontSize: 20, color: Colors.white),
      ),
      //flexibleSpace: Image.network(bg1, fit: BoxFit.cover),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
      ],
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF84994F),
    );
  }

  Widget _buildDrawer() {
    return Drawer(backgroundColor: Colors.grey, width: 250);
  }

  Widget _buildEndDrawer() {
    return Drawer();
  }

  Widget _buildFloating() {
    return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
      onPressed: () {},
      child: Icon(Icons.search),
    );
  }

  Widget _buildBody() {
    return _buildMainView();
  }

  Widget _buildMainView() {
    return ListView(children: [_buildSildeShow(), _buildFoodGridView()]);
  }

  Widget _buildSildeShow() {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          final item = imageList[index];

          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => SecondScreen(item),
                  fullscreenDialog: true,
                ),
              );
            },

            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: Image.network(
                        item.image,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: const EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Color(0xFF628141),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      item.title,
                      style: GoogleFonts.bokor(
                        //fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      //padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: foodlist.length,
      itemBuilder: (context, index) {
        final item = foodlist[index];

        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.network(
                  item.image,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xFF2C3930),
                //borderRadius: BorderRadius.circular(1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.odorMeanChey(
                      //fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  // Text(
                  //   '${item.price.toStringAsFixed(2)}\$',
                  //   style: GoogleFonts.odorMeanChey(
                  //     fontSize: 10,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
