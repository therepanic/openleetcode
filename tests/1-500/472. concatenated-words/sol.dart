class Solution {
  List<String> findAllConcatenatedWordsInADict(List<String> words) {
    List<String> res = [];
    Set<String> wordSet = Set.from(words);
    Set<String> incorrect = {};
    
    bool dfs(String word) {
        if (wordSet.contains(word)) return true;
        if (incorrect.contains(word)) return false;
        
        for (int i = 1; i < word.length; i++) {
            String prefix = word.substring(0, i);
            if (wordSet.contains(prefix)) {
                String suffix = word.substring(i);
                if (dfs(suffix)) {
                    return true;
                } else {
                    incorrect.add(suffix);
                }
            }
        }
        
        incorrect.add(word);
        return false;
    }
    
    for (String word in words) {
        wordSet.remove(word);
        if (dfs(word)) {
            res.add(word);
        }
        wordSet.add(word);
    }
    
    return res;
  }
}
