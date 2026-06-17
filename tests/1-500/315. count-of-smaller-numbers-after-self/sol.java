class Solution {
    public List<Integer> countSmaller(int[] nums) {
        List<Integer> sortedList = new ArrayList<>();
        List<Integer> ans = new ArrayList<>();
        for (int i = nums.length - 1; i >= 0; i--) {
            int n = nums[i];
            int idx = bisectLeft(sortedList, n);
            ans.add(idx);
            sortedList.add(idx, n);
        }
        Collections.reverse(ans);
        return ans;
    }
    
    private int bisectLeft(List<Integer> list, int target) {
        int lo = 0, hi = list.size();
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (list.get(mid) >= target) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        return lo;
    }
}
