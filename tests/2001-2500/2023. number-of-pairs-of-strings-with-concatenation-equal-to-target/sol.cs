public class Solution {
    public int NumOfPairs(string[] nums, string target) {
        var freq = new Dictionary<string, int>();
        foreach (var num in nums) {
            freq[num] = freq.GetValueOrDefault(num, 0) + 1;
        }

        int totalCnt = 0;

        foreach (var num in nums) {
            if (target.StartsWith(num)) {
                string remain = target.Substring(num.Length);

                if (remain == num) {
                    totalCnt += freq.GetValueOrDefault(remain, 0) - 1;
                } else {
                    totalCnt += freq.GetValueOrDefault(remain, 0);
                }
            }
        }

        return totalCnt;
    }
}
