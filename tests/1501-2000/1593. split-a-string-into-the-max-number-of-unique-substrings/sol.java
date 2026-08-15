class Solution {
    public int maxUniqueSplit(String s) {
        Set<String> used = new HashSet<>();
        int[] ans = new int[1];
        backtrack(s, 0, used, ans);
        return ans[0];
    }
    
    private void backtrack(String s, int index, Set<String> used, int[] ans) {
        if (index == s.length()) {
            ans[0] = Math.max(ans[0], used.size());
            return;
        }
        for (int j = index; j < s.length(); j++) {
            String curr = s.substring(index, j + 1);
            if (used.contains(curr)) continue;
            used.add(curr);
            backtrack(s, j + 1, used, ans);
            used.remove(curr);
        }
    }
}
