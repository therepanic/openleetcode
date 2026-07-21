class Solution {
    public int longestSubsequence(int[] arr, int difference) {
        java.util.Map<Integer, Integer> dic = new java.util.HashMap<>();
        for (int x : arr) {
            if (dic.containsKey(x - difference)) {
                dic.put(x, dic.get(x - difference) + 1);
            } else {
                dic.put(x, 1);
            }
        }
        int maxLen = 0;
        for (int val : dic.values()) {
            if (val > maxLen) {
                maxLen = val;
            }
        }
        return maxLen;
    }
}
