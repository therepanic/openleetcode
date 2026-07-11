class Solution {
  String toGoatLatin(String sentence) {
    final vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
    final words = sentence.split(' ');
    final ans = <String>[];
    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      String goat;
      if (vowels.contains(word[0])) {
        goat = word + 'ma';
      } else {
        goat = word.substring(1) + word[0] + 'ma';
      }
      goat += 'a' * (i + 1);
      ans.add(goat);
    }
    return ans.join(' ');
  }
}
