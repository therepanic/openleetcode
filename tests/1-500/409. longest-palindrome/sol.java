class Solution {
    public int longestPalindrome(String s) {
        java.util.Map<Character, Integer> count = new java.util.HashMap<>();
        for (char c : s.toCharArray()) {
            count.put(c, count.getOrDefault(c, 0) + 1);
        }
        
        int maxLen = 0;
        boolean odd = false;
        
        for (int freq : count.values()) {
            if (freq % 2 == 0) {
                maxLen += freq;
            } else {
                maxLen += freq - 1;
                odd = true;
            }
        }
        
        return maxLen + (odd ? 1 : 0);
    }
}
