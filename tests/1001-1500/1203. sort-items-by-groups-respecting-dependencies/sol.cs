public class Solution {
    public int[] SortItems(int n, int m, int[] group, IList<IList<int>> beforeItems) {
        var groupToItems = new Dictionary<int, HashSet<int>>();
        int newGroup = m;
        for (int i = 0; i < n; i++) {
            if (group[i] == -1) group[i] = newGroup++;
            if (!groupToItems.ContainsKey(group[i])) groupToItems[group[i]] = new HashSet<int>();
            groupToItems[group[i]].Add(i);
        }

        var intraPred = new Dictionary<int, HashSet<int>>();
        var intraSucc = new Dictionary<int, HashSet<int>>();
        var interPred = new Dictionary<int, HashSet<int>>();
        var interSucc = new Dictionary<int, HashSet<int>>();

        for (int i = 0; i < n; i++) {
            foreach (int before in beforeItems[i]) {
                if (group[i] == group[before]) {
                    if (!intraPred.ContainsKey(i)) intraPred[i] = new HashSet<int>();
                    intraPred[i].Add(before);
                    if (!intraSucc.ContainsKey(before)) intraSucc[before] = new HashSet<int>();
                    intraSucc[before].Add(i);
                } else {
                    if (!interPred.ContainsKey(group[i])) interPred[group[i]] = new HashSet<int>();
                    interPred[group[i]].Add(group[before]);
                    if (!interSucc.ContainsKey(group[before])) interSucc[group[before]] = new HashSet<int>();
                    interSucc[group[before]].Add(group[i]);
                }
            }
        }

        List<int> TopoSort(HashSet<int> nodes, Dictionary<int, HashSet<int>> pred, Dictionary<int, HashSet<int>> succ) {
            var order = new List<int>();
            var queue = new Queue<int>();
            foreach (int node in nodes) {
                if (!pred.ContainsKey(node) || pred[node].Count == 0) queue.Enqueue(node);
            }
            while (queue.Count > 0) {
                int node = queue.Dequeue();
                order.Add(node);
                if (succ.ContainsKey(node)) {
                    foreach (int s in succ[node]) {
                        if (pred.ContainsKey(s)) pred[s].Remove(node);
                        if (!pred.ContainsKey(s) || pred[s].Count == 0) queue.Enqueue(s);
                    }
                }
            }
            return order.Count == nodes.Count ? order : new List<int>();
        }

        var groupsOrder = TopoSort(new HashSet<int>(groupToItems.Keys), interPred, interSucc);
        if (groupsOrder.Count == 0) return new int[0];

        var result = new List<int>();
        foreach (int grp in groupsOrder) {
            var order = TopoSort(groupToItems[grp], intraPred, intraSucc);
            if (order.Count == 0) return new int[0];
            result.AddRange(order);
        }
        return result.ToArray();
    }
}
