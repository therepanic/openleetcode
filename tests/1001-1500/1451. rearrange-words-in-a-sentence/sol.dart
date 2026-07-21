class Solution {
  String arrangeWords(String text) {
    List<String> s = text.split(" ");
    s.sort((a, b) => a.length.compareTo(b.length));
    s = s.map((i) => i.toLowerCase()).toList();
    s[0] = s[0][0].toUpperCase() + s[0].substring(1);
    return s.join(" ");
  }
}
