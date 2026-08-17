func numberOfRounds(loginTime string, logoutTime string) int {
    toMinutes := func(t string) int {
        h, m := 0, 0
        fmt.Sscanf(t, "%d:%d", &h, &m)
        return h*60 + m
    }

    start := toMinutes(loginTime)
    end := toMinutes(logoutTime)

    if end < start {
        end += 24 * 60
    }

    startRound := (start + 14) / 15
    endRound := end / 15

    if endRound-startRound < 0 {
        return 0
    }
    return endRound - startRound
}
