function invalidTransactions(transactions: string[]): string[] {
  const userTxns: Map<string, string[][]> = new Map();
  const invalids: string[] = [];

  for (const txn of transactions) {
    const vals = txn.split(",");
    if (!userTxns.has(vals[0])) {
      userTxns.set(vals[0], []);
    }
    userTxns.get(vals[0])!.push(vals);
  }

  for (const [, txns] of userTxns) {
    txns.sort((a, b) => parseInt(a[1]) - parseInt(b[1]));
    const cities: Map<string, number> = new Map();
    let l = 0;
    const invalidTxnWithinWindow: Set<number> = new Set();

    for (let r = 0; r < txns.length; r++) {
      cities.set(txns[r][3], (cities.get(txns[r][3]) || 0) + 1);
      while (l < r && parseInt(txns[r][1]) - parseInt(txns[l][1]) > 60) {
        cities.set(txns[l][3], cities.get(txns[l][3])! - 1);
        if (cities.get(txns[l][3]) === 0) {
          cities.delete(txns[l][3]);
        }
        invalidTxnWithinWindow.delete(l);
        l++;
      }

      if (parseInt(txns[r][2]) > 1000) {
        invalids.push(txns[r].join(","));
      }
      if (cities.size > 1) {
        for (let i = l; i <= r; i++) {
          if (parseInt(txns[i][2]) <= 1000 && !invalidTxnWithinWindow.has(i)) {
            invalids.push(txns[i].join(","));
            invalidTxnWithinWindow.add(i);
          }
        }
      }
    }
  }

  return invalids;
}
