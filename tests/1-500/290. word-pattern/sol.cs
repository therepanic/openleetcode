public class Solution {
    public bool WordPattern(string pattern, string s) {
        string[] words = s.Split(' ');
        if (pattern.Length != words.Length) return false;
        
        HashSet<char> patternSet = new HashSet<char>();
        HashSet<string> wordSet = new HashSet<string>();
        HashSet<string> pairSet = new HashSet<string>();
        
        for (int i = 0; i < pattern.Length; i++) {
            patternSet.Add(pattern[i]);
            wordSet.Add(words[i]);
            pairSet.Add(pattern[i] + "," + words[i]);
        }
        
        return patternSet.Count == wordSet.Count && wordSet.Count == pairSet.Count;
    }
}
