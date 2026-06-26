class Solution {
    public int findMaxLength(int[] nums) {
        int count = 0;
        int maxLength = 0;
        java.util.Map<Integer, Integer> countMap = new java.util.HashMap<>();
        countMap.put(0, -1);

        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 0) {
                count--;
            } else {
                count++;
            }

            if (countMap.containsKey(count)) {
                maxLength = Math.max(maxLength, i - countMap.get(count));
            } else {
                countMap.put(count, i);
            }
        }

        return maxLength;
    }
}
