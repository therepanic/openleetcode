class Solution {
    public int numIdenticalPairs(int[] nums) {
        java.util.Map<Integer, Integer> pairs = new java.util.HashMap<>();
        int count = 0;
        for (int num : nums) {
            if (pairs.containsKey(num)) {
                count += pairs.get(num);
            }
            pairs.put(num, pairs.getOrDefault(num, 0) + 1);
        }
        return count;
    }
}
