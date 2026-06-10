class Solution {
    public java.util.List<String> wordBreak(String s, String[] wordDict) {
        java.util.Set<String> words = new java.util.HashSet<>(java.util.Arrays.asList(wordDict));
        return solve(s, words, new java.util.HashMap<>());
    }

    private java.util.List<String> solve(String s, java.util.Set<String> words, java.util.Map<String, java.util.List<String>> memo) {
        if (memo.containsKey(s)) return memo.get(s);
        java.util.List<String> result = new java.util.ArrayList<>();
        if (words.contains(s)) result.add(s);
        for (int i = 1; i < s.length(); i++) {
            String prefix = s.substring(0, i);
            if (!words.contains(prefix)) continue;
            for (String tail : solve(s.substring(i), words, memo)) {
                result.add(prefix + " " + tail);
            }
        }
        memo.put(s, result);
        return result;
    }
}
