public class Solution {
    public string GetPermutation(int n, int k) {
        var nums = new List<int>();
        var factorial = new int[n + 1];
        factorial[0] = 1;

        for (int i = 1; i <= n; i++) {
            nums.Add(i);
            factorial[i] = factorial[i - 1] * i;
        }

        k--;
        var res = new System.Text.StringBuilder();
        for (int remaining = n; remaining >= 1; remaining--) {
            int block = factorial[remaining - 1];
            int idx = k / block;
            k %= block;
            res.Append(nums[idx]);
            nums.RemoveAt(idx);
        }
        return res.ToString();
    }
}
