public class Solution {
    public IList<bool> CheckArithmeticSubarrays(int[] nums, int[] l, int[] r) {
        List<bool> ans = new List<bool>();
        for (int i = 0; i < l.Length; i++) {
            int[] sub = new int[r[i]-l[i]+1];
            Array.Copy(nums, l[i], sub, 0, r[i]-l[i]+1);
            Array.Sort(sub);
            bool valid = true;
            if (sub.Length > 2) {
                int d = sub[1] - sub[0];
                for (int j = 1; j < sub.Length-1; j++) {
                    if (sub[j+1] - sub[j] != d) {
                        valid = false;
                        break;
                    }
                }
            }
            ans.Add(valid);
        }
        return ans;
    }
}
