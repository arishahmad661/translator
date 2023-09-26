import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var lang1 = ["en", "hi", "ur"];
  var lang2 = ["en", "hi", "ur"];

  var selectedLang1 = "en";
  var selectedLang2 = "hi";

  final translator = GoogleTranslator();

  String textLang1 = "";
  String textLang2 = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(title: const Text("Translator App",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), centerTitle: true,backgroundColor: const Color.fromARGB(255, 87, 104, 254),elevation: 2,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("From:"),
                        DropdownButton(
                            value: selectedLang1,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: lang1.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value){
                              setState(() {
                                selectedLang1 = value!;
                              });
                            }
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)
                  ),
                  height: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: InputBorder.none
                        ),
                        onChanged: (value){
                          textLang1 = value;
                          translator.translate(textLang1,from: selectedLang1, to: selectedLang2).then((value) {
                            setState(() {
                              textLang2 = value.toString();
                            });
                          }
                          );
                        },
                      ),
                    )
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("To:"),
                        DropdownButton(
                            value: selectedLang2,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: lang2.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value){
                              setState(() {
                                selectedLang2 = value!;
                              });
                            }
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black)
                    ),
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(textLang2.toString()),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
