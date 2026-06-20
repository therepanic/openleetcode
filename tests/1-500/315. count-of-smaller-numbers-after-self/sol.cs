public class Solution {
    public IList<int> CountSmaller(int[] nums) {
        List<int> sortedList = new List<int>();
        List<int> ans = new List<int>();
        for (int i = nums.Length - 1; i >= 0; i--) {
            int n = nums[i];
            int idx = BisectLeft(sortedList, n);
            ans.Add(idx);
            sortedList.Insert(idx, n);
        }
        ans.Reverse();
        return ans;
    }
    
    private int BisectLeft(List<int> list, int target) {
        int lo = 0, hi = list.Count;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (list[mid] >= target) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        return lo;
    }
}
