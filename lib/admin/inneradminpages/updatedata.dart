import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partsbay/admin/admindatamanagement.dart';
import 'package:partsbay/screens/searchpage.dart';

class Updatedata extends StatelessWidget {
  late final String field;

  Updatedata({
    Key? key,
    required this.field,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerid = TextEditingController();
    TextEditingController _controllerdata = TextEditingController();
    TextEditingController _controllersize = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Update ' + field),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controllerid,
              decoration: InputDecoration(
                labelText: 'product id',
              ),
            ),
          ),
          field == 'count'
              ? Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controllersize,
                        decoration: InputDecoration(
                          labelText: 'size',
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          field == 'price' || field == 'count'
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerdata,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: field,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerdata,
                    decoration: InputDecoration(
                      labelText: 'Data',
                    ),
                  ),
                ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('update'),
            onPressed: () async {
              if (_controllerid.text.isNotEmpty &&
                  _controllerdata.text.isNotEmpty) {
                if (field == "price") {
                  Map<String, String?> result = await updatedata(
                      _controllerid.text, field, _controllerdata.text);
                  result = await updatedata(_controllerid.text, field,
                      int.parse(_controllerdata.text));
                  if (result['status'] == 'success') {
                    showdialogue(context, "Success", 'Product updated');
                  } else {
                    showdialogue(context, "Error", '${result['status']}');
                  }
                } else if (field == "count") {
                  Map<String, String?> result = await updatecount(
                      _controllerid.text,
                      _controllersize.text.toLowerCase(),
                      int.parse(_controllerdata.text));
                  result = await updatedata(_controllerid.text, field,
                      int.parse(_controllerdata.text));
                  if (result['status'] == 'success') {
                    showdialogue(context, "Success", 'Product updated');
                  } else {
                    showdialogue(context, "Error", '${result['status']}');
                  }
                } else {
                  Map<String, String?> result = await updatedata(
                      _controllerid.text, field, _controllerdata.text);
                  result = await updatedata(
                      _controllerid.text, field, _controllerdata.text);
                  if (result['status'] == 'success') {
                    showdialogue(context, "Success", 'Product updated');
                  } else {
                    showdialogue(context, "Error", '${result['status']}');
                  }
                }
              } else {
                showdialogue(context, "Error", 'Please fill all the fields');
              }
            },
          ),
        ],
      ),
    );
  }
}

void showdialogue(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
