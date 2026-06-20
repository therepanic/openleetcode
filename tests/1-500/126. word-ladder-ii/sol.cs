public class Solution {
    public IList<IList<string>> FindLadders(string beginWord, string endWord, IList<string> wordList) {
        var depth = new Dictionary<string, int> { [beginWord] = 1 };
        var wordSet = new HashSet<string>(wordList);
        var queue = new Queue<string>();
        queue.Enqueue(beginWord);
        wordSet.Remove(beginWord);
        while (queue.Count > 0) {
            var word = queue.Dequeue();
            var steps = depth[word];
            if (word == endWord) break;
            var chars = word.ToCharArray();
            for (int i = 0; i < chars.Length; i++) {
                char original = chars[i];
                for (char ch = 'a'; ch <= 'z'; ch++) {
                    chars[i] = ch;
                    var candidate = new string(chars);
                    if (wordSet.Remove(candidate)) { queue.Enqueue(candidate); depth[candidate] = steps + 1; }
                }
                chars[i] = original;
            }
        }
        var result = new List<IList<string>>();
        if (!depth.ContainsKey(endWord)) return result;
        var path = new List<string> { endWord };
        void Dfs(string word) {
            if (word == beginWord) { var seq = new List<string>(path); seq.Reverse(); result.Add(seq); return; }
            int steps = depth[word];
            var chars = word.ToCharArray();
            for (int i = 0; i < chars.Length; i++) {
                char original = chars[i];
                for (char ch = 'a'; ch <= 'z'; ch++) {
                    chars[i] = ch;
                    var candidate = new string(chars);
                    if (depth.TryGetValue(candidate, out int prev) && prev + 1 == steps) { path.Add(candidate); Dfs(candidate); path.RemoveAt(path.Count - 1); }
                }
                chars[i] = original;
            }
        }
        Dfs(endWord);
        return result;
    }
}
