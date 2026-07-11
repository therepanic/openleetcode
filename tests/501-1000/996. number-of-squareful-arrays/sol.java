class Solution {
    private int n;
    private int[] nums;

    public int numSquarefulPerms(int[] nums) {
        this.n = nums.length;
        this.nums = nums;
        java.util.Arrays.sort(this.nums);
        return backtrack(0, new java.util.ArrayList<>());
    }

    private boolean isSquareful(java.util.List<Integer> currNums, int num) {
        if (currNums.isEmpty()) return true;
        int prevNum = currNums.get(currNums.size() - 1);
        int pairSum = prevNum + num;
        if (pairSum < 0) return false;
        int sqrtN = (int) Math.sqrt(pairSum);
        return sqrtN * sqrtN == pairSum;
    }

    private int backtrack(int numsMask, java.util.List<Integer> currNums) {
        if (numsMask != 0 && currNums.size() == n) return 1;
        int numSquarefulPerms = 0;
        for (int idx = 0; idx < n; idx++) {
            int num = nums[idx];
            if (idx > 0 && nums[idx] == nums[idx - 1] && (numsMask & (1 << (idx - 1))) == 0) {
                continue;
            }
            if ((numsMask & (1 << idx)) == 0 && isSquareful(currNums, num)) {
                currNums.add(num);
                numSquarefulPerms += backtrack(numsMask | (1 << idx), currNums);
                currNums.remove(currNums.size() - 1);
            }
        }
        return numSquarefulPerms;
    }
}
