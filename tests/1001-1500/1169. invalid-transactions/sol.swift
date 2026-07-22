class Solution {
    func invalidTransactions(_ transactions: [String]) -> [String] {
        var userTxns = [String: [[String]]]()
        var invalids = [String]()

        for txn in transactions {
            let vals = txn.split(separator: ",").map(String.init)
            userTxns[vals[0], default: []].append(vals)
        }

        for (_, txns) in userTxns {
            var sorted = txns.sorted { Int($0[1])! < Int($1[1])! }
            var cities = [String: Int]()
            var l = 0
            var invalidTxnWithinWindow = Set<Int>()

            for r in 0..<sorted.count {
                cities[sorted[r][3], default: 0] += 1
                while l < r && Int(sorted[r][1])! - Int(sorted[l][1])! > 60 {
                    cities[sorted[l][3]]! -= 1
                    if cities[sorted[l][3]]! == 0 {
                        cities.removeValue(forKey: sorted[l][3])
                    }
                    invalidTxnWithinWindow.remove(l)
                    l += 1
                }

                if Int(sorted[r][2])! > 1000 {
                    invalids.append(sorted[r].joined(separator: ","))
                }
                if cities.count > 1 {
                    for i in l...r {
                        if Int(sorted[i][2])! <= 1000 && !invalidTxnWithinWindow.contains(i) {
                            invalids.append(sorted[i].joined(separator: ","))
                            invalidTxnWithinWindow.insert(i)
                        }
                    }
                }
            }
        }

        return invalids
    }
}
