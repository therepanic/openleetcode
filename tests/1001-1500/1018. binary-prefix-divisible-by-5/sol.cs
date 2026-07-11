public class Solution {
    public IList<bool> PrefixesDivBy5(int[] nums) {
        IList<bool> ans = new List<bool>();
        int val = 0;
        foreach (int bit in nums) {
            val = (val * 2 + bit) % 5;
            ans.Add(val == 0);
        }
        return ans;
    }
}
