class Solution {
    func distanceBetweenBusStops(_ distance: [Int], _ start: Int, _ destination: Int) -> Int {
        var s = start
        var d = destination
        if d < s {
            (s, d) = (d, s)
        }
        let clockwise = distance[s..<d].reduce(0, +)
        let total = distance.reduce(0, +)
        return min(clockwise, total - clockwise)
    }
}
