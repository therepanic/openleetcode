class Solution {
    func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        return zip(startTime, endTime).filter { $0 <= queryTime && queryTime <= $1 }.count
    }
}
