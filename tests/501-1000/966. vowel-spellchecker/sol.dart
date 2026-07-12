class Solution {
  List<String> spellchecker(List<String> wordlist, List<String> queries) {
    Set<String> exact = Set.from(wordlist);
    Map<String, String> caseMap = {};
    Map<String, String> vowelMap = {};
    
    for (String w in wordlist) {
      String lower = w.toLowerCase();
      String devowel = deVowel(lower);
      if (!caseMap.containsKey(lower)) {
        caseMap[lower] = w;
      }
      if (!vowelMap.containsKey(devowel)) {
        vowelMap[devowel] = w;
      }
    }
    
    List<String> result = [];
    for (String q in queries) {
      if (exact.contains(q)) {
        result.add(q);
      } else {
        String lower = q.toLowerCase();
        String devowel = deVowel(lower);
        if (caseMap.containsKey(lower)) {
          result.add(caseMap[lower]!);
        } else if (vowelMap.containsKey(devowel)) {
          result.add(vowelMap[devowel]!);
        } else {
          result.add("");
        }
      }
    }
    return result;
  }
  
  String deVowel(String s) {
    return s.split('').map((c) => 'aeiou'.contains(c) ? '*' : c).join();
  }
}
