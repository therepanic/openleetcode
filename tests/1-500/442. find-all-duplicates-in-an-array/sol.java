class Solution {
    public List<Integer> findDuplicates(int[] nums) {
        List<Integer> r = new ArrayList<>();
        for (int x : nums) {
            int idx = Math.abs(x) - 1;
            if (nums[idx] < 0) {
                r.add(Math.abs(x));
            } else {
                nums[idx] = -nums[idx];
            }
        }
        return r;
    }
}
