class Solution {
    public int countKDifference(int[] nums, int k) {
        Map<Integer, Integer> c = new HashMap<>();
        for (int num : nums) {
            c.put(num, c.getOrDefault(num, 0) + 1);
        }
        int ans = 0;
        for (int x : c.keySet()) {
            ans += c.get(x) * c.getOrDefault(x + k, 0);
        }
        return ans;
    }
}
