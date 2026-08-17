class Solution {
    public int minAbsDifference(int[] nums, int goal) {
        java.util.List<Integer> leftSums = new java.util.ArrayList<>();
        java.util.List<Integer> rightSums = new java.util.ArrayList<>();
        int mid = nums.length / 2;
        generateSums(nums, 0, mid, 0, leftSums);
        generateSums(nums, mid, nums.length, 0, rightSums);
        java.util.Collections.sort(leftSums);
        java.util.Collections.sort(rightSums);
        int answer = Math.abs(goal);
        int j = rightSums.size() - 1;
        for (int value : leftSums) {
            while (j > 0 && rightSums.get(j - 1) >= goal - value) {
                j--;
            }
            answer = Math.min(answer, Math.abs(value + rightSums.get(j) - goal));
            if (j > 0) {
                answer = Math.min(answer, Math.abs(value + rightSums.get(j - 1) - goal));
            }
        }
        return answer;
    }
    
    private void generateSums(int[] nums, int start, int end, int current, java.util.List<Integer> result) {
        if (start == end) {
            result.add(current);
            return;
        }
        generateSums(nums, start + 1, end, current, result);
        generateSums(nums, start + 1, end, current + nums[start], result);
    }
}
