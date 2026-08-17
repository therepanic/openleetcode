class Solution {
    func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
        let target_time = times[targetFriend]
        let sortedTimes = times.sorted { $0[0] < $1[0] }

        let n = sortedTimes.count
        var chair_time = [Int](repeating: 0, count: n)

        for time in sortedTimes {
            for i in 0..<n {
                if chair_time[i] <= time[0] {
                    chair_time[i] = time[1]
                    if time == target_time {
                        return i
                    }
                    break
                }
            }
        }

        return 0
    }
}
