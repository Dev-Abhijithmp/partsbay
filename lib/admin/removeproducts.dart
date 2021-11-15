import 'package:flutter/material.dart';
import 'package:partsbay/admin/admindatamanagement.dart';
import 'package:partsbay/screens/searchpage.dart';

class Removeproducts extends StatelessWidget {
  const Removeproducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Products'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'product id',
            ),
          ),
          ElevatedButton(
            child: Text('Remove'),
            onPressed: () async {
              if (_controller.text.isNotEmpty) {
                Map<String, String?> result =
                    await removeproducts(_controller.text);
                if (result['status'] == 'success') {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: Text('Product Removed'),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Ok'),
                              onPressed: () {
                                controller.clear();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('${result['message']}'),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                controller.clear();
                              },
                            ),
                          ],
                        );
                      });
                }
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a product id'),
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
            },
          ),
        ],
      ),
    );
  }
}
