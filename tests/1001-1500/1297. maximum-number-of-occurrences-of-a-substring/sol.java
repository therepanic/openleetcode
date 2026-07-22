class Solution {
    public int maxFreq(String s, int maxLetters, int minSize, int maxSize) {
        Map<String, Integer> count = new HashMap<>();
        Map<Character, Integer> unique = new HashMap<>();
        int left = 0;
        int res = 0;
        for (int right = 0; right < s.length(); right++) {
            char rc = s.charAt(right);
            unique.put(rc, unique.getOrDefault(rc, 0) + 1);

            while (unique.size() > maxLetters || right - left + 1 > minSize) {
                char lc = s.charAt(left);
                unique.put(lc, unique.get(lc) - 1);
                if (unique.get(lc) == 0) {
                    unique.remove(lc);
                }
                left++;
            }

            if (right - left + 1 == minSize && unique.size() <= maxLetters) {
                String curr = s.substring(left, right + 1);
                int val = count.getOrDefault(curr, 0) + 1;
                count.put(curr, val);
                res = Math.max(res, val);
            }
        }
        return res;
    }
}
