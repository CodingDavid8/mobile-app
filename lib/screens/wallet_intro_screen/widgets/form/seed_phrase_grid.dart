import 'package:deus_mobile/statics/my_colors.dart';
import 'package:deus_mobile/statics/styles.dart';
import 'package:flutter/material.dart';

class SeedPhraseGrid extends StatelessWidget {
  final List<String> wordList;
  final BuildContext context;

  const SeedPhraseGrid({Key key, this.wordList, this.context})
      : super(key: key);

  List<Row> getGrid(List<String> words) {
    List<String> usedWords = [...words];

    List<Row> reList = List.generate(3, (index) {
      double width = MediaQuery.of(context).size.width - 60;
      List<String> rowWords = [];
      List<int> rowWidths = [];

      for (int i = 0; i < usedWords.length; i++) {
        String wrd = usedWords[i];
        int wrdWidth = wrd.length * 10 + 6;
        if (wrdWidth <= width) {
          width -= wrdWidth;
          rowWords.add(usedWords[i]);
          rowWidths.add(wrdWidth);
          usedWords.removeAt(i);
        } else {
          break;
        }
      }
      return Row(
        children: List.generate(rowWords.length,
            (index) => _textContainer(rowWords[index], rowWidths[index])),
      );
    });

    return reList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.Button_BG_Black,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        child: Column(
          children: getGrid(wordList),
        ));
  }

  Container _textContainer(String txt, int w) {
    return Container(
      width: w.toDouble(),
      margin: EdgeInsets.only(right: 5, bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        txt,
        style: MyStyles.blackMediumTextStyle.copyWith(fontSize: 15),
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
    );
  }
}
