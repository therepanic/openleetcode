class Solution {
    public int maxNonOverlapping(int[] nums, int target) {
        int num_of_subarrays = 0;
        int temp = 0;
        Set<Integer> visited = new HashSet<>();
        visited.add(0);
        for (int num : nums) {
            temp += num;
            int prev = temp - target;
            if (visited.contains(prev)) {
                visited = new HashSet<>();
                num_of_subarrays++;
            }
            visited.add(temp);
        }
        return num_of_subarrays;
    }
}
