public class Solution {
    private void AddInTrie(Dictionary<string, object> trie, string word) {
        var n = trie;
        foreach (char letter in word) {
            string key = letter.ToString();
            if (!n.ContainsKey(key)) {
                n[key] = new Dictionary<string, object> { { "*", false } };
            }
            n = (Dictionary<string, object>)n[key];
        }
        n["*"] = true;
    }
    
    private string GetReplacement(Dictionary<string, object> trie, string word) {
        var n = trie;
        for (int i = 0; i < word.Length; i++) {
            if ((bool)n["*"]) {
                return word.Substring(0, i);
            }
            string key = word[i].ToString();
            if (!n.ContainsKey(key)) {
                break;
            }
            n = (Dictionary<string, object>)n[key];
        }
        return word;
    }
    
    public string ReplaceWords(IList<string> dictionary, string sentence) {
        var trie = new Dictionary<string, object> { { "*", false } };
        string[] arr = sentence.Split(' ');
        
        foreach (string word in dictionary) {
            AddInTrie(trie, word);
        }
        
        for (int i = 0; i < arr.Length; i++) {
            arr[i] = GetReplacement(trie, arr[i]);
        }
        
        return string.Join(" ", arr);
    }
}
