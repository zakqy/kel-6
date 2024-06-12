import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/screen/admin/add_update_dosen.dart';

import '../../model/dosen.dart';

class ListDosen extends StatefulWidget {
  const ListDosen({super.key});

  @override
  State<ListDosen> createState() => _ListDosenState();
}

class _ListDosenState extends State<ListDosen> {
  List<Dosen> _listDosen = [];

  void getDosen() async {
    _listDosen = await EventDb.getDosen();

    setState(() {});
  }

  @override
  void initState() {
    getDosen();
    super.initState();
  }

  void showOption(Dosen? dosen) async {
    var result = await Get.dialog(
        SimpleDialog(
          children: [
            ListTile(
              onTap: () => Get.back(result: 'update'),
              title: Text('Update'),
            ),
            ListTile(
              onTap: () => Get.back(result: 'delete'),
              title: Text('Delete'),
            ),
            ListTile(
              onTap: () => Get.back(),
              title: Text('Close'),
            )
          ],
        ),
        barrierDismissible: false);
    switch (result) {
      case 'update':
      Get.to (AddUpdateDosen(dosen: dosen,))
      ?.then((value) => getDosen());
        break;
      case 'delete':
      EventDb.deleteDosen(dosen!.ndin!).
      then((value) => getDosen());
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Dosen",
        ),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          _listDosen.length > 0
              ? ListView.builder(
                  itemCount: _listDosen.length,
                  itemBuilder: (context, index) {
                    Dosen dosen = _listDosen[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(dosen.ndin ?? ''),
                      subtitle: Text(dosen.ndin ?? ''),
                      trailing: IconButton(
                          onPressed: () {
                            showOption(dosen);
                          }, icon: Icon(Icons.more_vert)),
                    );
                  },
                )
              : Center(
                  child: Text("Data Kosong"),
                ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: Asset.colorAccent,
            ),
          )
        ],
      ),
    );
  }
}
