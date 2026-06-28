class Solution {
    public int findShortestSubArray(int[] nums) {
        Map<Integer, Integer> left = new HashMap<>();
        Map<Integer, Integer> right = new HashMap<>();
        Map<Integer, Integer> count = new HashMap<>();
        
        for (int i = 0; i < nums.length; i++) {
            int x = nums[i];
            if (!left.containsKey(x)) {
                left.put(x, i);
            }
            right.put(x, i);
            count.put(x, count.getOrDefault(x, 0) + 1);
        }
        
        int ans = nums.length;
        int degree = 0;
        for (int c : count.values()) {
            degree = Math.max(degree, c);
        }
        
        for (int x : count.keySet()) {
            if (count.get(x) == degree) {
                ans = Math.min(ans, right.get(x) - left.get(x) + 1);
            }
        }
        
        return ans;
    }
}
