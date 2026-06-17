class Solution {
  String reverseVowels(String s) {
    String vowels = "aeiouAEIOU";
    List<String> chars = s.split('');
    int i = 0, j = chars.length - 1;
    while (i < j) {
      while (i < j && !vowels.contains(chars[i])) {
        i++;
      }
      while (i < j && !vowels.contains(chars[j])) {
        j--;
      }
      String temp = chars[i];
      chars[i] = chars[j];
      chars[j] = temp;
      i++;
      j--;
    }
    return chars.join('');
  }
}
