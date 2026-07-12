class Solution {
    func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
        var fuel = startFuel
        var count = 0
        var heap = [Int]()
        var extended = stations
        extended.append([target, 0])
        var i = 0
        while i < extended.count {
            if fuel >= target { return count }
            while i < extended.count && extended[i][0] <= fuel {
                heap.append(extended[i][1])
                heap.sort(by: >)
                i += 1
            }
            if heap.isEmpty { return -1 }
            fuel += heap.removeFirst()
            count += 1
        }
        return -1
    }
}
