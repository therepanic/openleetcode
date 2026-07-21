class Solution {
    public int numberOfSubarrays(int[] nums, int k) {
        java.util.Map<Integer, Integer> count = new java.util.HashMap<>();
        count.put(0, 1);
        int odd = 0;
        int answer = 0;
        for (int value : nums) {
            odd += value % 2;
            answer += count.getOrDefault(odd - k, 0);
            count.put(odd, count.getOrDefault(odd, 0) + 1);
        }
        return answer;
    }
}
