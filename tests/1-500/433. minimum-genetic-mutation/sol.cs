public class Solution {
    public int MinMutation(string startGene, string endGene, string[] bank) {
        var s = new HashSet<string>(bank);
        if (!s.Contains(endGene) && startGene != endGene) return -1;
        var q = new Queue<(string, int)>();
        var v = new HashSet<string>();
        q.Enqueue((startGene, 0));
        v.Add(startGene);
        char[] choices = {'A', 'C', 'G', 'T'};
        while (q.Count > 0) {
            var (g, d) = q.Dequeue();
            if (g == endGene) return d;
            for (int i = 0; i < 8; i++) {
                foreach (char c in choices) {
                    if (g[i] != c) {
                        var n = g.Substring(0, i) + c + g.Substring(i+1);
                        if (s.Contains(n) && !v.Contains(n)) {
                            v.Add(n);
                            q.Enqueue((n, d+1));
                        }
                    }
                }
            }
        }
        return -1;
    }
}
