class Solution {
  List<String> wordSubsets(List<String> words1, List<String> words2) {
    List<int> maxCharFreq = List.filled(26, 0);
    List<int> tempCharFreq = List.filled(26, 0);

    for (var word in words2) {
      for (var ch in word.codeUnits) {
        tempCharFreq[ch - 'a'.codeUnitAt(0)]++;
      }
      for (int i = 0; i < 26; i++) {
        maxCharFreq[i] = maxCharFreq[i] > tempCharFreq[i] ? maxCharFreq[i] : tempCharFreq[i];
      }
      tempCharFreq = List.filled(26, 0);
    }

    List<String> universalWords = [];

    for (var word in words1) {
      for (var ch in word.codeUnits) {
        tempCharFreq[ch - 'a'.codeUnitAt(0)]++;
      }
      bool isUniversal = true;
      for (int i = 0; i < 26; i++) {
        if (maxCharFreq[i] > tempCharFreq[i]) {
          isUniversal = false;
          break;
        }
      }
      if (isUniversal) {
        universalWords.add(word);
      }
      tempCharFreq = List.filled(26, 0);
    }

    return universalWords;
  }
}
