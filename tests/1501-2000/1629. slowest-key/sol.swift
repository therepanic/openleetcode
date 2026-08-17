class Solution {
    func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
        var maxTime = releaseTimes[0]
        var ans = keysPressed[keysPressed.startIndex]
        let chars = Array(keysPressed)
        for i in 1..<releaseTimes.count {
            let currTime = releaseTimes[i] - releaseTimes[i-1]
            if currTime > maxTime {
                maxTime = currTime
                ans = chars[i]
            } else if currTime == maxTime {
                if chars[i] > ans {
                    ans = chars[i]
                }
            }
        }
        return ans
    }
}
