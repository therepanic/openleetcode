class Solution {
  List<String> findOcurrences(String text, String first, String second) {
    List<String> words = text.split(' ');
    List<String> result = [];
    for (int i = 0; i < words.length - 2; i++) {
      if (words[i] == first && words[i + 1] == second) {
        result.add(words[i + 2]);
      }
    }
    return result;
  }
}
