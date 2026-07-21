class Solution {
  List<String> invalidTransactions(List<String> transactions) {
    Map<String, List<List<String>>> userTxns = {};
    List<String> invalids = [];

    for (var txn in transactions) {
      var vals = txn.split(",");
      userTxns.putIfAbsent(vals[0], () => []).add(vals);
    }

    for (var entry in userTxns.entries) {
      var txns = entry.value;
      txns.sort((a, b) => int.parse(a[1]).compareTo(int.parse(b[1])));
      Map<String, int> cities = {};
      int l = 0;
      Set<int> invalidTxnWithinWindow = {};

      for (int r = 0; r < txns.length; r++) {
        cities[txns[r][3]] = (cities[txns[r][3]] ?? 0) + 1;
        while (l < r && int.parse(txns[r][1]) - int.parse(txns[l][1]) > 60) {
          cities[txns[l][3]] = cities[txns[l][3]]! - 1;
          if (cities[txns[l][3]] == 0) {
            cities.remove(txns[l][3]);
          }
          invalidTxnWithinWindow.remove(l);
          l++;
        }

        if (int.parse(txns[r][2]) > 1000) {
          invalids.add(txns[r].join(","));
        }
        if (cities.length > 1) {
          for (int i = l; i <= r; i++) {
            if (int.parse(txns[i][2]) <= 1000 && !invalidTxnWithinWindow.contains(i)) {
              invalids.add(txns[i].join(","));
              invalidTxnWithinWindow.add(i);
            }
          }
        }
      }
    }

    return invalids;
  }
}
