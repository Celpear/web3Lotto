import 'package:flutter/material.dart';
import 'dart:js' as js;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LottoPage(),
    );
  }
}

class LottoPage extends StatefulWidget {
  const LottoPage({super.key});

  @override
  State<LottoPage> createState() => _LottoPageState();
}

class _LottoPageState extends State<LottoPage> {
  int pot = 0;
  bool login = false;
  String adresse = "";

  void dartUpdateEvent(dynamic _data) {
    print('Hello from Dart!:' + _data.toString());
  }

  void dartUpdateAdresse(String _adresse) {
    try {
      setState(() {
        adresse = _adresse;
        login = true;
      });
    } catch (e) {}
  }

  void dartSetPot(int _amount) {
    try {
      setState(() {
        pot = _amount;
      });
    } catch (e) {
      print("setPot Error:" + e.toString());
    }
  }

  void dartWinnerUpdate(String _adresse, int _amount) {
    print("dartWinnerUpdate() adresse: ${_adresse} amount: ${_amount}");
  }

  @override
  void initState() {
    // TODO: implement initState
    js.context['dartUpdateEvent'] = js.allowInterop(dartUpdateEvent);
    js.context['dartSetPot'] = js.allowInterop(dartSetPot);
    js.context['dartUpdateAdresse'] = js.allowInterop(dartUpdateAdresse);
    js.context['dartWinnerUpdate'] = js.allowInterop(dartWinnerUpdate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CCN-Lotto")),
      body: login
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            "${((pot / 1000000000000000000) * 1757.54).toStringAsFixed(2)}€",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(adresse),
                  const SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width < 600
                        ? MediaQuery.of(context).size.width
                        : 600,
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 5, top: 5),
                    child: Card(
                        color: Colors.orange,
                        child: TextButton(
                          child: const Text("Buy Ticket"),
                          onPressed: () {
                            js.context.callMethod('payTicket', []);
                          },
                        )),
                  ),
                  false
                      ? Container(
                          width: MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width
                              : 600,
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 5, top: 5),
                          child: Card(
                              color: Colors.red,
                              child: TextButton(
                                child: const Text("Payout"),
                                onPressed: () {
                                  js.context.callMethod('payout', []);
                                },
                              )),
                        )
                      : SizedBox()
                ],
              ),
            )
          : Center(
              child: Card(
                  color: Colors.green,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text("Connect to Wallet"),
                      onPressed: () {
                        setState(() {
                          js.context.callMethod('walletConnect', []);
                        });
                      },
                    ),
                  )),
            ),
    );
  }
}
