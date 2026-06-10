class Solution {
    public int longestConsecutive(int[] nums) {
        java.util.Set<Integer> seen = new java.util.HashSet<>();
        for (int num : nums) seen.add(num);
        int best = 0;
        for (int num : seen) {
            if (seen.contains(num - 1)) continue;
            int current = num, streak = 1;
            while (seen.contains(current + 1)) { current++; streak++; }
            best = Math.max(best, streak);
        }
        return best;
    }
}
