public class Solution {
    public bool CloseStrings(string word1, string word2) {
        if (word1.Length != word2.Length) return false;
        HashSet<char> set1 = new HashSet<char>(word1);
        HashSet<char> set2 = new HashSet<char>(word2);
        if (!set1.SetEquals(set2)) return false;
        Dictionary<int, int> dct = new Dictionary<int, int>();
        foreach (char x in set1) {
            int n1 = word1.Count(c => c == x);
            int n2 = word2.Count(c => c == x);
            dct[n1] = dct.GetValueOrDefault(n1) + 1;
            dct[n2] = dct.GetValueOrDefault(n2) - 1;
        }
        return dct.Values.All(v => v == 0);
    }
}
