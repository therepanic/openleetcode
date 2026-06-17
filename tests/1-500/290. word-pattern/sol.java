class Solution {
    public boolean wordPattern(String pattern, String s) {
        String[] words = s.split(" ");
        if (pattern.length() != words.length) return false;
        
        Set<Character> patternSet = new HashSet<>();
        Set<String> wordSet = new HashSet<>();
        Set<String> pairSet = new HashSet<>();
        
        for (int i = 0; i < pattern.length(); i++) {
            patternSet.add(pattern.charAt(i));
            wordSet.add(words[i]);
            pairSet.add(pattern.charAt(i) + "," + words[i]);
        }
        
        return patternSet.size() == wordSet.size() && wordSet.size() == pairSet.size();
    }
}
