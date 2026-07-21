public class Solution {
    public IList<int> FindNumOfValidWords(string[] words, string[] puzzles) {
        int GetMask(string s) {
            int mask = 0;
            foreach (char c in s) {
                mask |= 1 << (c - 'a');
            }
            return mask;
        }
        
        Dictionary<int, int> wordCount = new Dictionary<int, int>();
        foreach (string w in words) {
            int mask = GetMask(w);
            if (wordCount.ContainsKey(mask)) {
                wordCount[mask]++;
            } else {
                wordCount[mask] = 1;
            }
        }
        
        List<int> result = new List<int>();
        foreach (string p in puzzles) {
            int firstMask = 1 << (p[0] - 'a');
            int puzzleMask = GetMask(p);
            int sub = puzzleMask;
            int count = 0;
            while (true) {
                if ((sub & firstMask) != 0 && wordCount.ContainsKey(sub)) {
                    count += wordCount[sub];
                }
                if (sub == 0) break;
                sub = (sub - 1) & puzzleMask;
            }
            result.Add(count);
        }
        return result;
    }
}
