public class Solution {
    public bool PyramidTransition(string bottom, IList<string> allowed) {
        var tab = new Dictionary<string, HashSet<char>>();
        foreach (var a in allowed) {
            string key = $"{a[0]}{a[1]}";
            if (!tab.ContainsKey(key)) tab[key] = new HashSet<char>();
            tab[key].Add(a[2]);
        }
        
        var visited = new HashSet<string>();
        return Dfs(bottom, tab, visited);
    }
    
    private bool Dfs(string node, 
                     Dictionary<string, HashSet<char>> tab,
                     HashSet<string> visited) {
        if (node.Length == 1) return true;
        if (visited.Contains(node)) return false;
        
        var neighbors = GetNeighbors(node, tab);
        foreach (var nxt in neighbors) {
            if (Dfs(nxt, tab, visited)) return true;
        }
        
        visited.Add(node);
        return false;
    }
    
    private List<string> GetNeighbors(string node,
                                       Dictionary<string, HashSet<char>> tab) {
        var res = new List<string> { "" };
        for (int i = 1; i < node.Length; i++) {
            string key = $"{node[i-1]}{node[i]}";
            if (!tab.ContainsKey(key) || tab[key].Count == 0) return new List<string>();
            
            var newRes = new List<string>();
            foreach (var r in res) {
                foreach (char c in tab[key]) {
                    newRes.Add(r + c);
                }
            }
            res = newRes;
        }
        return res;
    }
}
