class Solution {
  String reverseWords(String s) {
    List<String> words = s.split(' ');
    List<String> reversedWords = words.map((word) => word.split('').reversed.join()).toList();
    return reversedWords.join(' ');
  }
}
