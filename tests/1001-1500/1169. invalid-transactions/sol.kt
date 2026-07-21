class Solution {
    fun invalidTransactions(transactions: Array<String>): List<String> {
        val userTxns = mutableMapOf<String, MutableList<List<String>>>()
        val invalids = mutableListOf<String>()

        for (txn in transactions) {
            val vals = txn.split(",")
            userTxns.getOrPut(vals[0]) { mutableListOf() }.add(vals)
        }

        for ((_, txns) in userTxns) {
            txns.sortBy { it[1].toInt() }
            val cities = mutableMapOf<String, Int>()
            var l = 0
            val invalidTxnWithinWindow = mutableSetOf<Int>()

            for (r in txns.indices) {
                val txn = txns[r]
                cities[txn[3]] = cities.getOrDefault(txn[3], 0) + 1
                while (l < r && txns[r][1].toInt() - txns[l][1].toInt() > 60) {
                    cities[txns[l][3]] = cities[txns[l][3]]!! - 1
                    if (cities[txns[l][3]] == 0) {
                        cities.remove(txns[l][3])
                    }
                    invalidTxnWithinWindow.remove(l)
                    l++
                }

                if (txn[2].toInt() > 1000) {
                    invalids.add(txn.joinToString(","))
                }
                if (cities.size > 1) {
                    for (i in l..r) {
                        val inner = txns[i]
                        if (inner[2].toInt() <= 1000 && i !in invalidTxnWithinWindow) {
                            invalids.add(inner.joinToString(","))
                            invalidTxnWithinWindow.add(i)
                        }
                    }
                }
            }
        }

        return invalids
    }
}
