class Solution {
    public int findPairs(int[] nums, int k) {
        if (k < 0) return 0;
        int count = 0;
        Map<Integer, Integer> numCounts = new HashMap<>();
        for (int num : nums) {
            numCounts.put(num, numCounts.getOrDefault(num, 0) + 1);
        }
        for (Map.Entry<Integer, Integer> entry : numCounts.entrySet()) {
            int num = entry.getKey();
            if (k == 0) {
                if (entry.getValue() >= 2) count++;
            } else {
                if (numCounts.containsKey(num + k)) count++;
            }
        }
        return count;
    }
}
