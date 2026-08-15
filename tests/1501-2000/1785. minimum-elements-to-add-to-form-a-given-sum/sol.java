class Solution {
    public int minElements(int[] nums, int limit, int goal) {
        long currentSum = 0;
        for (int num : nums) {
            currentSum += num;
        }
        long diff = Math.abs((long)goal - currentSum);
        return (int)((diff + limit - 1) / limit);
    }
}
