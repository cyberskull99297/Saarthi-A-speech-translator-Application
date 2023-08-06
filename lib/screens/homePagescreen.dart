import 'package:ai_asistant/utils/pallete.dart';
import 'package:ai_asistant/reusable_widgets/reusable_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:translator/translator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleTranslator translator = new GoogleTranslator();
  final lang = TextEditingController();
  var out = 'Hindi text to be generated';
  var out1 = 'Chinese text to be generated';
  var out2 = 'Spanish text to be generated';
  var out3 = 'Japanese text to be generated';
  var out4 = 'Kannada text to be generated';
  TextEditingController nameController = TextEditingController();
  String fullName = '';

  final speechToText = SpeechToText();
  String lastWords = 'Speech can be seen here !';
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
      // print(lastWords);
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text(
            'सारथी ||',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // virtual assistant picture
            ZoomIn(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top: 4),
                      decoration: const BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    height: 123,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/virtualAssistant.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Tap the Mic button and speak",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // chat bubble
            FadeInRight(
              child: Visibility(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 3,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Pallete.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(20).copyWith(
                      topLeft: Radius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      lastWords,
                      style: const TextStyle(
                        fontFamily: 'Cera Pro',
                        color: Pallete.mainFontColor,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // features list
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 30),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      // border: OutlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6200EE)),
                      ),
                      labelText: 'Input Text',
                      icon: Icon(Icons.translate),
                      labelStyle: TextStyle(
                        color: Color(0xFF6200EE),
                      ),
                    ),
                    onChanged: (text) {
                      translator.translate(text, to: 'hi').then((s) {
                        print(s);
                        setState(() {
                          out = s.toString();
                        });
                      });
                      translator.translate(text, to: 'zh-cn').then((s) {
                        print(s);
                        setState(() {
                          out1 = s.toString();
                        });
                      });
                      translator.translate(text, to: 'es').then((s) {
                        setState(() {
                          out2 = s.toString();
                        });
                      });
                      translator.translate(text, to: 'ja').then((s) {
                        setState(() {
                          out3 = s.toString();
                        });
                      });
                      translator.translate(text, to: 'kn').then((s) {
                        print(s);
                        setState(() {
                          out4 = s.toString();
                        });
                      });
                    },
                    onSubmitted: (text) {
                      lastWords = text;
                    },
                  ),
                ),
                SlideInRight(
                  child: Visibility(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10, left: 22),
                      child: const Text(
                        'Here are a few features',
                        style: TextStyle(
                          fontFamily: 'Cera Pro',
                          color: Pallete.mainFontColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start),
                  child: InkWell(
                    onTap: () async {
                      // trans(lastWords);
                      translator.translate(lastWords, to: 'hi').then((s) {
                        print(s);
                        setState(() {
                          out = s.toString();
                        });
                      });
                    },
                    child: featureBox(
                        context, Pallete.firstSuggestionBoxColor, "Hindi", out),
                  ),
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start + delay),
                  child: InkWell(
                    onTap: () async {
                      // trans(lastWords);
                      translator.translate(lastWords, to: 'zh-cn').then((s) {
                        print(s);
                        setState(() {
                          out1 = s.toString();
                        });
                      });
                    },
                    child: featureBox(context, Pallete.secondSuggestionBoxColor,
                        "Chinese", out1),
                  ),
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start + delay + delay),
                  child: InkWell(
                    onTap: () async {
                      // trans(lastWords);
                      translator.translate(lastWords, to: 'es').then((s) {
                        print(s);
                        setState(() {
                          out2 = s.toString();
                        });
                      });
                    },
                    child: featureBox(
                      context,
                      Pallete.firstSuggestionBoxColor,
                      "Spanish",
                      out2,
                    ),
                  ),
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start + delay + delay),
                  child: InkWell(
                    onTap: () async {
                      // trans(lastWords);
                      translator.translate(lastWords, to: 'ja').then((s) {
                        print(s);
                        setState(() {
                          out3 = s.toString();
                        });
                      });
                    },
                    child: featureBox(
                      context,
                      Pallete.secondSuggestionBoxColor,
                      "Japanese",
                      out3,
                    ),
                  ),
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start + delay + delay),
                  child: InkWell(
                    onTap: () async {
                      // trans(lastWords);
                      translator.translate(lastWords, to: 'kn').then((s) {
                        print(s);
                        setState(() {
                          out4 = s.toString();
                        });
                      });
                    },
                    child: featureBox(
                      context,
                      Pallete.firstSuggestionBoxColor,
                      "Kannada",
                      out4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: ZoomIn(
        delay: Duration(milliseconds: start + 3 * delay),
        child: FloatingActionButton(
          backgroundColor: Pallete.blackColor,
          onPressed: () async {
            setState(() {
              out = 'Hindi text to generate';
              out1 = 'Chinese text to generate';
              out2 = 'Spanish text to generate';
              out3 = 'Japanese text to generate';
              out4 = 'Kannada text to generate';
            });
            if (await speechToText.hasPermission &&
                speechToText.isNotListening) {
              await startListening();
              await startListening();
            } else {
              initSpeechToText();
            }
          },
          child: Icon(
            speechToText.isListening ? Icons.stop : Icons.mic,
          ),
        ),
      ),
    );
  }
}
