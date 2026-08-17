class Solution {
    public int[] findingUsersActiveMinutes(int[][] logs, int k) {
        Map<Integer, Set<Integer>> mp = new HashMap<>();
        for (int[] log : logs) {
            mp.computeIfAbsent(log[0], x -> new HashSet<>()).add(log[1]);
        }
        int[] ans = new int[k];
        for (Set<Integer> set : mp.values()) {
            int size = set.size();
            if (size <= k) {
                ans[size - 1]++;
            }
        }
        return ans;
    }
}
