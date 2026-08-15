public class Solution {
    public int BeautySum(string s) {
        int n = s.Length;
        int sumOfBeauty = 0;
        for (int i = 0; i < n; i++) {
            int[] freq = new int[26];
            for (int j = i; j < n; j++) {
                freq[s[j] - 'a']++;
                int maxi = -1;
                int mini = int.MaxValue;
                foreach (int diff in freq) {
                    if (diff > 0) {
                        maxi = Math.Max(maxi, diff);
                        mini = Math.Min(mini, diff);
                    }
                }
                sumOfBeauty += maxi - mini;
            }
        }
        return sumOfBeauty;
    }
}
