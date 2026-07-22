class Solution {
    public List<String> invalidTransactions(String[] transactions) {
        Map<String, List<String[]>> userTxns = new HashMap<>();
        List<String> invalids = new ArrayList<>();

        for (String txn : transactions) {
            String[] vals = txn.split(",");
            userTxns.computeIfAbsent(vals[0], k -> new ArrayList<>()).add(vals);
        }

        for (String user : userTxns.keySet()) {
            List<String[]> txns = userTxns.get(user);
            txns.sort((a, b) -> Integer.compare(Integer.parseInt(a[1]), Integer.parseInt(b[1])));
            Map<String, Integer> cities = new HashMap<>();
            int l = 0;
            Set<Integer> invalidTxnWithinWindow = new HashSet<>();

            for (int r = 0; r < txns.size(); r++) {
                String[] txn = txns.get(r);
                cities.put(txn[3], cities.getOrDefault(txn[3], 0) + 1);
                while (l < r && Integer.parseInt(txns.get(r)[1]) - Integer.parseInt(txns.get(l)[1]) > 60) {
                    cities.put(txns.get(l)[3], cities.get(txns.get(l)[3]) - 1);
                    if (cities.get(txns.get(l)[3]) == 0) {
                        cities.remove(txns.get(l)[3]);
                    }
                    invalidTxnWithinWindow.remove(l);
                    l++;
                }

                if (Integer.parseInt(txn[2]) > 1000) {
                    invalids.add(String.join(",", txn));
                }
                if (cities.size() > 1) {
                    for (int i = l; i <= r; i++) {
                        String[] inner = txns.get(i);
                        if (Integer.parseInt(inner[2]) <= 1000 && !invalidTxnWithinWindow.contains(i)) {
                            invalids.add(String.join(",", inner));
                            invalidTxnWithinWindow.add(i);
                        }
                    }
                }
            }
        }

        return invalids;
    }
}
