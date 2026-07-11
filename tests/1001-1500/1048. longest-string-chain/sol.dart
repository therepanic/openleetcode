class Solution {
  int longestStrChain(List<String> words) {
    Map<String, int> chains = {};
    words.sort((a, b) => a.length.compareTo(b.length));
    
    for (String word in words) {
      chains[word] = 1;
      for (int i = 0; i < word.length; i++) {
        String pred = word.substring(0, i) + word.substring(i + 1);
        if (chains.containsKey(pred)) {
          chains[word] = max(chains[word]!, chains[pred]! + 1);
        }
      }
    }
    
    int maxLen = 0;
    for (int len in chains.values) {
      if (len > maxLen) maxLen = len;
    }
    return maxLen;
  }
}
