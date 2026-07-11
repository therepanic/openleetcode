class Solution {
  List<String> commonChars(List<String> words) {
    Map<String, int> freq = {};
    for (var c in words[0].split('')) {
      freq[c] = (freq[c] ?? 0) + 1;
    }
    for (int i = 1; i < words.length; i++) {
      Map<String, int> f = {};
      for (var c in words[i].split('')) {
        f[c] = (f[c] ?? 0) + 1;
      }
      for (var c in freq.keys.toList()) {
        if (f.containsKey(c)) {
          freq[c] = f[c]! < freq[c]! ? f[c]! : freq[c]!;
        } else {
          freq[c] = 0;
        }
      }
    }
    List<String> res = [];
    freq.forEach((c, count) {
      for (int j = 0; j < count; j++) {
        res.add(c);
      }
    });
    return res;
  }
}
