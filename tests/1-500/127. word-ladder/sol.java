class Solution {
    public int ladderLength(String beginWord, String endWord, String[] wordList) {
        java.util.Set<String> wordSet = new java.util.HashSet<>(java.util.Arrays.asList(wordList));
        if (!wordSet.contains(endWord)) {
            return 0;
        }
        java.util.ArrayDeque<java.util.AbstractMap.SimpleEntry<String, Integer>> queue = new java.util.ArrayDeque<>();
        queue.offer(new java.util.AbstractMap.SimpleEntry<>(beginWord, 1));
        while (!queue.isEmpty()) {
            var entry = queue.poll();
            String word = entry.getKey();
            int steps = entry.getValue();
            if (word.equals(endWord)) {
                return steps;
            }
            char[] chars = word.toCharArray();
            for (int i = 0; i < chars.length; i++) {
                char original = chars[i];
                for (char ch = 'a'; ch <= 'z'; ch++) {
                    chars[i] = ch;
                    String candidate = new String(chars);
                    if (wordSet.remove(candidate)) {
                        queue.offer(new java.util.AbstractMap.SimpleEntry<>(candidate, steps + 1));
                    }
                }
                chars[i] = original;
            }
        }
        return 0;
    }
}
