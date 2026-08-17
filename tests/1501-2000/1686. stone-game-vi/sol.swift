class Solution {
    func stoneGameVI(_ aliceValues: [Int], _ bobValues: [Int]) -> Int {
        let n = aliceValues.count
        var combined = [(total: Int, a: Int, b: Int)]()
        for i in 0..<n {
            combined.append((aliceValues[i] + bobValues[i], aliceValues[i], bobValues[i]))
        }
        combined.sort { $0.total > $1.total }

        var alice = 0, bob = 0
        for (i, item) in combined.enumerated() {
            if i % 2 == 0 {
                alice += item.a
            } else {
                bob += item.b
            }
        }

        if alice > bob { return 1 }
        else if alice < bob { return -1 }
        else { return 0 }
    }
}
