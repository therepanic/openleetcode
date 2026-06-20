class Solution {
    public java.util.List<java.util.List<String>> findLadders(String beginWord, String endWord, String[] wordList) {
        java.util.Map<String, Integer> depth = new java.util.HashMap<>();
        java.util.Set<String> wordSet = new java.util.HashSet<>(java.util.Arrays.asList(wordList));
        java.util.ArrayDeque<String> queue = new java.util.ArrayDeque<>();
        queue.offer(beginWord);
        depth.put(beginWord, 1);
        wordSet.remove(beginWord);
        while (!queue.isEmpty()) {
            String word = queue.poll();
            int steps = depth.get(word);
            if (word.equals(endWord)) break;
            char[] chars = word.toCharArray();
            for (int i = 0; i < chars.length; i++) {
                char original = chars[i];
                for (char ch = 'a'; ch <= 'z'; ch++) {
                    chars[i] = ch;
                    String candidate = new String(chars);
                    if (wordSet.remove(candidate)) { queue.offer(candidate); depth.put(candidate, steps + 1); }
                }
                chars[i] = original;
            }
        }
        java.util.List<java.util.List<String>> result = new java.util.ArrayList<>();
        if (!depth.containsKey(endWord)) return result;
        java.util.List<String> path = new java.util.ArrayList<>();
        path.add(endWord);
        dfs(endWord, beginWord, depth, path, result);
        return result;
    }

    private void dfs(String word, String beginWord, java.util.Map<String, Integer> depth, java.util.List<String> path, java.util.List<java.util.List<String>> result) {
        if (word.equals(beginWord)) {
            java.util.List<String> seq = new java.util.ArrayList<>(path);
            java.util.Collections.reverse(seq);
            result.add(seq);
            return;
        }
        int steps = depth.get(word);
        char[] chars = word.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            char original = chars[i];
            for (char ch = 'a'; ch <= 'z'; ch++) {
                chars[i] = ch;
                String candidate = new String(chars);
                Integer prev = depth.get(candidate);
                if (prev != null && prev + 1 == steps) {
                    path.add(candidate);
                    dfs(candidate, beginWord, depth, path, result);
                    path.remove(path.size() - 1);
                }
            }
            chars[i] = original;
        }
    }
}
