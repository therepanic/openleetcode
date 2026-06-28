public class Solution {
    public int MinStickers(string[] stickers, string target) {
        var memo = new Dictionary<string, int>();
        int result = Dfs(stickers, target, 0, memo);
        return result == int.MaxValue ? -1 : result;
    }
    
    private int Dfs(string[] stickers, string target, int idx, Dictionary<string, int> memo) {
        if (string.IsNullOrEmpty(target)) return 0;
        if (idx == stickers.Length) return int.MaxValue;
        
        string key = $"{idx},{target}";
        if (memo.ContainsKey(key)) return memo[key];
        
        int result = Dfs(stickers, target, idx + 1, memo);
        
        string currentSticker = stickers[idx];
        var newTargetChars = new List<char>(target);
        bool somethingRemoved = false;
        foreach (char c in currentSticker) {
            int idxToRemove = newTargetChars.IndexOf(c);
            if (idxToRemove != -1) {
                newTargetChars.RemoveAt(idxToRemove);
                somethingRemoved = true;
            }
        }
        
        if (somethingRemoved) {
            int subResult = Dfs(stickers, new string(newTargetChars.ToArray()), idx, memo);
            if (subResult != int.MaxValue) {
                result = Math.Min(result, 1 + subResult);
            }
        }
        
        memo[key] = result;
        return result;
    }
}
