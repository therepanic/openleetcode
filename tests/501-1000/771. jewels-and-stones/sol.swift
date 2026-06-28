class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var count = 0
        for i in jewels {
            if stones.contains(i) {
                count += stones.filter { $0 == i }.count
            }
        }
        return count
    }
}
