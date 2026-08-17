func slowestKey(releaseTimes []int, keysPressed string) byte {
    maxTime := releaseTimes[0]
    ans := keysPressed[0]
    for i := 1; i < len(releaseTimes); i++ {
        currTime := releaseTimes[i] - releaseTimes[i-1]
        if currTime > maxTime {
            maxTime = currTime
            ans = keysPressed[i]
        } else if currTime == maxTime {
            if keysPressed[i] > ans {
                ans = keysPressed[i]
            }
        }
    }
    return ans
}
