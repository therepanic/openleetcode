class Solution {
    public int beautySum(String s) {
        int n = s.length();
        int sumOfBeauty = 0;
        for (int i = 0; i < n; i++) {
            int[] freq = new int[26];
            for (int j = i; j < n; j++) {
                freq[s.charAt(j) - 'a']++;
                int maxi = Integer.MIN_VALUE;
                int mini = Integer.MAX_VALUE;
                for (int diff : freq) {
                    if (diff > 0) {
                        maxi = Math.max(maxi, diff);
                        mini = Math.min(mini, diff);
                    }
                }
                sumOfBeauty += (maxi - mini);
            }
        }
        return sumOfBeauty;
    }
}
