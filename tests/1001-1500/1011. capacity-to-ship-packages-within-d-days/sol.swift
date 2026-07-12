class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var low = weights.max()!
        var high = weights.reduce(0, +)

        while low <= high {
            let mid = (low + high) / 2

            var requiredDays = 1
            var load = 0

            for weight in weights {
                if load + weight > mid {
                    requiredDays += 1
                    load = weight
                } else {
                    load += weight
                }
            }

            if requiredDays <= days {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return low
    }
}
