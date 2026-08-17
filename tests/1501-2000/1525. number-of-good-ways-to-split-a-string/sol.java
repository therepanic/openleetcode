class Solution {
    public int numSplits(String s) {
        int n = s.length();
        int counter = 0;
        Map<Character, Integer> distinct_left = new HashMap<>();
        Map<Character, Integer> distinct_right = new HashMap<>();

        for (char c : s.toCharArray()) {
            distinct_right.put(c, distinct_right.getOrDefault(c, 0) + 1);
        }
        for (int i = 0; i < n - 1; i++) {
            char c = s.charAt(i);
            distinct_left.put(c, distinct_left.getOrDefault(c, 0) + 1);
            distinct_right.put(c, distinct_right.get(c) - 1);
            if (distinct_right.get(c) == 0) {
                distinct_right.remove(c);
            }
            if (distinct_left.size() == distinct_right.size()) {
                counter++;
            }
        }

        return counter;
    }
}
