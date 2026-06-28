class Solution {
public:
    int minStickers(vector<string>& stickers, string target) {
        unordered_map<string, int> memo;
        int result = dfs(stickers, target, 0, memo);
        return result == INT_MAX ? -1 : result;
    }
    
private:
    int dfs(vector<string>& stickers, string target, int idx, unordered_map<string, int>& memo) {
        if (target.empty()) return 0;
        if (idx == stickers.size()) return INT_MAX;
        
        string key = to_string(idx) + "," + target;
        if (memo.count(key)) return memo[key];
        
        int result = dfs(stickers, target, idx + 1, memo);
        
        string currentSticker = stickers[idx];
        string newTarget = target;
        bool somethingRemoved = false;
        for (char c : currentSticker) {
            size_t idxToRemove = newTarget.find(c);
            if (idxToRemove != string::npos) {
                newTarget.erase(idxToRemove, 1);
                somethingRemoved = true;
            }
        }
        
        if (somethingRemoved) {
            int subResult = dfs(stickers, newTarget, idx, memo);
            if (subResult != INT_MAX) {
                result = min(result, 1 + subResult);
            }
        }
        
        memo[key] = result;
        return result;
    }
};
