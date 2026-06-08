import java.util.*;

class Solution {
    public List<Integer> findSubstring(String s, String[] words) {
        List<Integer> ans = new ArrayList<>();
        if (s.isEmpty() || words.length == 0) return ans;

        int wordLen = words[0].length();
        int wordCount = words.length;
        Map<String, Integer> target = new HashMap<>();
        for (String word : words) target.put(word, target.getOrDefault(word, 0) + 1);

        for (int offset = 0; offset < wordLen; offset++) {
            int left = offset;
            int right = offset;
            int used = 0;
            Map<String, Integer> window = new HashMap<>();

            while (right + wordLen <= s.length()) {
                String word = s.substring(right, right + wordLen);
                right += wordLen;

                if (target.containsKey(word)) {
                    window.put(word, window.getOrDefault(word, 0) + 1);
                    used++;
                    while (window.get(word) > target.get(word)) {
                        String leftWord = s.substring(left, left + wordLen);
                        window.put(leftWord, window.get(leftWord) - 1);
                        left += wordLen;
                        used--;
                    }
                    if (used == wordCount) {
                        ans.add(left);
                        String leftWord = s.substring(left, left + wordLen);
                        window.put(leftWord, window.get(leftWord) - 1);
                        left += wordLen;
                        used--;
                    }
                } else {
                    window.clear();
                    used = 0;
                    left = right;
                }
            }
        }
        return ans;
    }
}
