class Solution {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        let houses = houses.sorted()
        let heaters = heaters.sorted()
        var radius = 0
        for house in houses {
            var left = 0, right = heaters.count - 1
            while left < right {
                let mid = (left + right) / 2
                if heaters[mid] < house {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            var dist = abs(heaters[left] - house)
            if left > 0 {
                dist = min(dist, abs(heaters[left - 1] - house))
            }
            radius = max(radius, dist)
        }
        return radius
    }
}
