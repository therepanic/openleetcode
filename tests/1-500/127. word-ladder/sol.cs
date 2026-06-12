public class Solution {
    public int LadderLength(string beginWord, string endWord, IList<string> wordList) {
        var wordSet = new HashSet<string>(wordList);
        if (!wordSet.Contains(endWord)) return 0;
        var queue = new Queue<(string word, int steps)>();
        queue.Enqueue((beginWord, 1));
        while (queue.Count > 0) {
            var (word, steps) = queue.Dequeue();
            if (word == endWord) return steps;
            var chars = word.ToCharArray();
            for (int i = 0; i < chars.Length; i++) {
                char original = chars[i];
                for (char ch = 'a'; ch <= 'z'; ch++) {
                    chars[i] = ch;
                    var candidate = new string(chars);
                    if (wordSet.Remove(candidate)) queue.Enqueue((candidate, steps + 1));
                }
                chars[i] = original;
            }
        }
        return 0;
    }
}
