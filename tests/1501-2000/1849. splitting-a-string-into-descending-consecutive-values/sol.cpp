class Solution {
public:
    bool splitString(string s) {
        return dfs(s, 0, -1, 0);
    }
    
private:
    bool dfs(string& s, int index, long long prev, int count) {
        if (index == s.size()) {
            return count >= 2;
        }
        
        long long curr = 0;
        for (int i = index; i < s.size(); i++) {
            curr = curr * 10 + (s[i] - '0');
            if (prev == -1 || prev - curr == 1) {
                if (dfs(s, i + 1, curr, count + 1)) {
                    return true;
                }
            } else if (curr >= prev && prev != -1) {
                break;
            }
        }
        return false;
    }
};
