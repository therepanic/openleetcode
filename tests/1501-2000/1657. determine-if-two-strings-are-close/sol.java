class Solution {
    public boolean closeStrings(String word1, String word2) {
        if (word1.length() != word2.length()) return false;
        Set<Character> set1 = new HashSet<>();
        Set<Character> set2 = new HashSet<>();
        for (char c : word1.toCharArray()) set1.add(c);
        for (char c : word2.toCharArray()) set2.add(c);
        if (!set1.equals(set2)) return false;
        Map<Integer, Integer> dct = new HashMap<>();
        for (char x : set1) {
            int n1 = countChar(word1, x);
            int n2 = countChar(word2, x);
            dct.put(n1, dct.getOrDefault(n1, 0) + 1);
            dct.put(n2, dct.getOrDefault(n2, 0) - 1);
        }
        for (int v : dct.values()) {
            if (v != 0) return false;
        }
        return true;
    }
    private int countChar(String s, char c) {
        int cnt = 0;
        for (char ch : s.toCharArray()) if (ch == c) cnt++;
        return cnt;
    }
}
