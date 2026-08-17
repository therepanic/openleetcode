class Solution {
    func maxProfit(_ inventory: [Int], _ orders: Int) -> Int {
        let maxVal = inventory.max()!
        let t = binarySearch(inventory, 0, maxVal, orders)
        var total: Int64 = 0
        var sold: Int64 = 0
        for ball in inventory {
            if Int64(ball) > t {
                let cnt = Int64(ball) - t
                total += (Int64(ball) + t + 1) * cnt / 2
                sold += cnt
            }
        }
        let extra = sold - Int64(orders)
        let res = total - extra * (t + 1)
        let mod: Int64 = 1000000007
        return Int((res % mod + mod) % mod)
    }

    private func binarySearch(_ arr: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int64 {
        var l = left
        var r = right
        while l < r {
            let mid = (l + r + 1) / 2
            var count: Int64 = 0
            for x in arr {
                if x > mid {
                    count += Int64(x - mid)
                }
            }
            if count >= Int64(target) {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return Int64(l)
    }
}
