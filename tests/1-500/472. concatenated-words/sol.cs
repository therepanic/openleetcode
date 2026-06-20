public class Solution {
    public IList<string> FindAllConcatenatedWordsInADict(string[] words) {
        var res = new List<string>();
        var wordSet = new HashSet<string>(words);
        var incorrect = new HashSet<string>();
        
        bool Dfs(string word) {
            if (wordSet.Contains(word)) return true;
            if (incorrect.Contains(word)) return false;
            
            for (int i = 1; i < word.Length; i++) {
                string prefix = word.Substring(0, i);
                if (wordSet.Contains(prefix)) {
                    string suffix = word.Substring(i);
                    if (Dfs(suffix)) {
                        return true;
                    } else {
                        incorrect.Add(suffix);
                    }
                }
            }
            
            incorrect.Add(word);
            return false;
        }
        
        foreach (var word in words) {
            wordSet.Remove(word);
            if (Dfs(word)) {
                res.Add(word);
            }
            wordSet.Add(word);
        }
        
        return res;
    }
}
