class Solution {
  String reorderSpaces(String text) {
    List<String> words = text.trim().split(RegExp(r'\s+'));
    int total = text.split(' ').length - 1;
    if (words.length == 1) {
      return words[0] + ' ' * total;
    }
    int gap = total ~/ (words.length - 1);
    int extra = total % (words.length - 1);
    return words.join(' ' * gap) + ' ' * extra;
  }
}
