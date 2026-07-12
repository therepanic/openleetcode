class Solution {
    public int longestStrChain(String[] words) {
        Map<String, Integer> chains = new HashMap<>();
        Arrays.sort(words, (a, b) -> a.length() - b.length());
        
        for (String word : words) {
            chains.put(word, 1);
            for (int i = 0; i < word.length(); i++) {
                String pred = word.substring(0, i) + word.substring(i + 1);
                if (chains.containsKey(pred)) {
                    chains.put(word, Math.max(chains.get(word), chains.get(pred) + 1));
                }
            }
        }
        
        int maxLen = 0;
        for (int len : chains.values()) {
            maxLen = Math.max(maxLen, len);
        }
        return maxLen;
    }
}
