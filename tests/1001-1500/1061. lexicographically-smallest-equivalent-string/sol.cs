public class Solution {
    public string SmallestEquivalentString(string s1, string s2, string baseStr) {
        Dictionary<char, List<char>> adj = new Dictionary<char, List<char>>();
        for (int i = 0; i < s1.Length; i++) {
            char a = s1[i], b = s2[i];
            if (!adj.ContainsKey(a)) adj[a] = new List<char>();
            if (!adj.ContainsKey(b)) adj[b] = new List<char>();
            adj[a].Add(b);
            adj[b].Add(a);
        }

        char DFS(char ch, HashSet<char> visited) {
            visited.Add(ch);
            char minCh = ch;
            if (adj.ContainsKey(ch)) {
                foreach (char nei in adj[ch]) {
                    if (!visited.Contains(nei)) {
                        char candidate = DFS(nei, visited);
                        if (candidate < minCh) minCh = candidate;
                    }
                }
            }
            return minCh;
        }

        char[] result = new char[baseStr.Length];
        for (int i = 0; i < baseStr.Length; i++) {
            HashSet<char> visited = new HashSet<char>();
            result[i] = DFS(baseStr[i], visited);
        }
        return new string(result);
    }
}
