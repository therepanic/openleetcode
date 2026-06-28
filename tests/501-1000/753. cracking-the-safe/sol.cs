public class Solution {
    public string CrackSafe(int n, int k) {
        if (n == 1) {
            return string.Join("", Enumerable.Range(0, k));
        }
        
        var adj = new Dictionary<string, Stack<int>>();
        string startNode = new string('0', n - 1);
        var res = new System.Text.StringBuilder();
        
        void Visit(string node) {
            if (!adj.ContainsKey(node)) {
                adj[node] = new Stack<int>();
                for (int i = k - 1; i >= 0; i--) {
                    adj[node].Push(i);
                }
            }
            while (adj[node].Count > 0) {
                int digit = adj[node].Pop();
                string nextNode = (node + digit.ToString()).Substring(1);
                Visit(nextNode);
                res.Append(digit);
            }
        }
        
        Visit(startNode);
        return res.ToString() + startNode;
    }
}
