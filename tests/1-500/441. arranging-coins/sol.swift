import Foundation

class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        return Int((sqrt(8.0 * Double(n) + 1) - 1) / 2)
    }
}
