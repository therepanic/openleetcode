public class Solution {
    public int LongestSubsequence(int[] arr, int difference) {
        var dic = new Dictionary<int, int>();
        int maxLen = 0;
        foreach (int x in arr) {
            if (dic.ContainsKey(x - difference)) {
                dic[x] = dic[x - difference] + 1;
            } else {
                dic[x] = 1;
            }
            if (dic[x] > maxLen) {
                maxLen = dic[x];
            }
        }
        return maxLen;
    }
}
