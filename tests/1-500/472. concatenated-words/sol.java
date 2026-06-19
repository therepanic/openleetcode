class Solution {
    public List<String> findAllConcatenatedWordsInADict(String[] words) {
        List<String> res = new ArrayList<>();
        Set<String> wordSet = new HashSet<>(Arrays.asList(words));
        Set<String> incorrect = new HashSet<>();
        
        for (String word : words) {
            wordSet.remove(word);
            if (dfs(word, wordSet, incorrect)) {
                res.add(word);
            }
            wordSet.add(word);
        }
        
        return res;
    }
    
    private boolean dfs(String word, Set<String> wordSet, Set<String> incorrect) {
        if (wordSet.contains(word)) {
            return true;
        }
        if (incorrect.contains(word)) {
            return false;
        }
        
        for (int i = 1; i < word.length(); i++) {
            String prefix = word.substring(0, i);
            if (wordSet.contains(prefix)) {
                String suffix = word.substring(i);
                if (dfs(suffix, wordSet, incorrect)) {
                    return true;
                } else {
                    incorrect.add(suffix);
                }
            }
        }
        
        incorrect.add(word);
        return false;
    }
}
