class Solution {
    public boolean splitString(String s) {
        return dfs(0, -1, s, 0);
    }
    
    private boolean dfs(int index, long prev, String s, int count) {
        if (index == s.length()) {
            return count >= 2;
        }
        
        long curr = 0;
        for (int i = index; i < s.length(); i++) {
            curr = curr * 10 + (s.charAt(i) - '0');
            if (prev == -1 || prev - curr == 1) {
                if (dfs(i + 1, curr, s, count + 1)) {
                    return true;
                }
            } else if (curr >= prev && prev != -1) {
                break;
            }
        }
        return false;
    }
}
