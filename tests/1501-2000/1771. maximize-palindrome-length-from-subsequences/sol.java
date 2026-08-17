class Solution {
    public int longestPalindrome(String word1, String word2) {
        String word = word1 + word2;
        int n = word.length();
        int[][] memo = new int[n][n];
        for (int[] row : memo) Arrays.fill(row, -1);
        int ans = 0;
        
        for (char c : word1.toCharArray()) {
            int i = word1.indexOf(c);
            int j = word2.lastIndexOf(c);
            if (i != -1 && j != -1) {
                ans = Math.max(ans, fn(i, j + word1.length(), word, memo));
            }
        }
        return ans;
    }
    
    private int fn(int lo, int hi, String word, int[][] memo) {
        if (lo >= hi) return lo == hi ? 1 : 0;
        if (memo[lo][hi] != -1) return memo[lo][hi];
        if (word.charAt(lo) == word.charAt(hi)) {
            memo[lo][hi] = 2 + fn(lo+1, hi-1, word, memo);
        } else {
            memo[lo][hi] = Math.max(fn(lo+1, hi, word, memo), fn(lo, hi-1, word, memo));
        }
        return memo[lo][hi];
    }
}
