class Solution {
  List<int> numSmallerByFrequency(List<String> queries, List<String> words) {
    int f(String s) {
      String minChar = 'z';
      int count = 0;
      for (int i = 0; i < s.length; i++) {
        if (s[i].compareTo(minChar) < 0) {
          minChar = s[i];
          count = 1;
        } else if (s[i] == minChar) {
          count++;
        }
      }
      return count;
    }
    
    List<int> buckets = List.filled(12, 0);
    for (String w in words) {
      buckets[f(w)]++;
    }
    for (int i = 9; i >= 0; i--) {
      buckets[i] += buckets[i + 1];
    }
    
    return queries.map((q) => buckets[f(q) + 1]).toList();
  }
}
