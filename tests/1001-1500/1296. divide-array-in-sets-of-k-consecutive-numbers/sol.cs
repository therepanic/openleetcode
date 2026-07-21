public class Solution {
    public bool IsPossibleDivide(int[] nums, int k) {
        if (nums.Length % k != 0) return false;
        var count = new Dictionary<int, int>();
        foreach (int num in nums) {
            if (count.ContainsKey(num)) count[num]++;
            else count[num] = 1;
        }
        Array.Sort(nums);
        foreach (int num in nums) {
            if (count[num] == 0) continue;
            for (int i = 0; i < k; i++) {
                int cur = num + i;
                if (!count.ContainsKey(cur) || count[cur] == 0) return false;
                count[cur]--;
            }
        }
        return true;
    }
}
