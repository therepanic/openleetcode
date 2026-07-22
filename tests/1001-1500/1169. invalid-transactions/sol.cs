public class Solution {
    public IList<string> InvalidTransactions(string[] transactions) {
        var userTxns = new Dictionary<string, List<string[]>>();
        var invalids = new List<string>();

        foreach (var txn in transactions) {
            var vals = txn.Split(',');
            if (!userTxns.ContainsKey(vals[0])) {
                userTxns[vals[0]] = new List<string[]>();
            }
            userTxns[vals[0]].Add(vals);
        }

        foreach (var kvp in userTxns) {
            var txns = kvp.Value;
            txns.Sort((a, b) => int.Parse(a[1]).CompareTo(int.Parse(b[1])));
            var cities = new Dictionary<string, int>();
            int l = 0;
            var invalidTxnWithinWindow = new HashSet<int>();

            for (int r = 0; r < txns.Count; r++) {
                var txn = txns[r];
                if (!cities.ContainsKey(txn[3])) cities[txn[3]] = 0;
                cities[txn[3]]++;

                while (l < r && int.Parse(txns[r][1]) - int.Parse(txns[l][1]) > 60) {
                    cities[txns[l][3]]--;
                    if (cities[txns[l][3]] == 0) {
                        cities.Remove(txns[l][3]);
                    }
                    invalidTxnWithinWindow.Remove(l);
                    l++;
                }

                if (int.Parse(txn[2]) > 1000) {
                    invalids.Add(string.Join(",", txn));
                }
                if (cities.Count > 1) {
                    for (int i = l; i <= r; i++) {
                        if (int.Parse(txns[i][2]) <= 1000 && !invalidTxnWithinWindow.Contains(i)) {
                            invalids.Add(string.Join(",", txns[i]));
                            invalidTxnWithinWindow.Add(i);
                        }
                    }
                }
            }
        }

        return invalids;
    }
}
