class Solution {
    public int singleNumber(int[] nums) {
        long totalSum = 0;
        java.util.Set<Integer> seen = new java.util.HashSet<>();
        for (int num : nums) {
            totalSum += num;
            seen.add(num);
        }
        long uniqueSum = 0;
        for (int num : seen) {
            uniqueSum += num;
        }
        long numerator = 3 * uniqueSum - totalSum;
        return (int) (numerator >> 1);
    }
}
