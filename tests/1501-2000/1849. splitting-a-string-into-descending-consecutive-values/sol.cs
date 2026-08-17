public class Solution {
    public bool SplitString(string s) {
        return Dfs(s, 0, -1, 0);
    }
    
    private bool Dfs(string s, int index, long prev, int count) {
        if (index == s.Length) {
            return count >= 2;
        }
        
        long curr = 0;
        for (int i = index; i < s.Length; i++) {
            curr = curr * 10 + (s[i] - '0');
            if (prev == -1 || prev - curr == 1) {
                if (Dfs(s, i + 1, curr, count + 1)) {
                    return true;
                }
            } else if (curr >= prev && prev != -1) {
                break;
            }
        }
        return false;
    }
}
