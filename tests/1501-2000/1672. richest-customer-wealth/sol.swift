class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var rich = 0
        for i in accounts {
            rich = max(rich, i.reduce(0, +))
        }
        return rich
    }
}
