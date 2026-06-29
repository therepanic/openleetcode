func readBinaryWatch(turnedOn int) []string {
    result := []string{}
    for hour := 0; hour < 12; hour++ {
        for minute := 0; minute < 60; minute++ {
            if bits.OnesCount(uint(hour)) + bits.OnesCount(uint(minute)) == turnedOn {
                result = append(result, fmt.Sprintf("%d:%02d", hour, minute))
            }
        }
    }
    return result
}
