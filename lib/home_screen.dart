import 'package:flutter/material.dart';
import 'package:jobswire_app/model/model.dart';
import 'package:jobswire_app/service/service.dart';

class JobSwire extends StatefulWidget {
  @override
  _JobSwireState createState() => _JobSwireState();
}

class _JobSwireState extends State<JobSwire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("JobSwire")),
      ),
      body: FutureBuilder(
        future: JobSwireService().datas(),
        builder: (BuildContext context,
            AsyncSnapshot<List<JobSwireModel>?> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data?[index].position ?? "null"),
                        trailing: Text(snapshot.data?[index].date!
                                .substring(0, 10)
                                .toString() ??
                            "null"),
                        leading: CircleAvatar(
                          child: Image.network(
                              snapshot.data?[index].logo.toString() ?? "null"),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Bilgi"),
                                content: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Şirket\n" +
                                            snapshot.data![index].company!),
                                        //Text(),
                                        Text("Lokasyon\n" +
                                            snapshot.data![index].location!),
                                        //  Text(),
                                      ],
                                    ),
                                    Divider(
                                      height: 50,
                                    ),
                                    Center(
                                        child: Text(
                                      "Açıklama",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    Divider(
                                      endIndent: 100,
                                      indent: 100,
                                    ),
                                    Text(snapshot.data![index].description!),
                                  ],
                                )),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: Text("Kapat"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
