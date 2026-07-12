public class Solution {
    public int SubarraysDivByK(int[] nums, int k) {
        int s = 0;
        int res = 0;
        var hs = new Dictionary<int, int>();
        hs[0] = 1;
        foreach (int num in nums) {
            s += num;
            int rem = s % k;
            if (rem < 0) rem += k;
            if (hs.ContainsKey(rem)) {
                res += hs[rem];
                hs[rem]++;
            } else {
                hs[rem] = 1;
            }
        }
        return res;
    }
}
