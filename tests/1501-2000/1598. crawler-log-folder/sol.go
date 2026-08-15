func minOperations(logs []string) int {
    output := 0
    for _, log := range logs {
        if log == "../" {
            output--
            if output < 0 {
                output = 0
            }
        } else if log == "./" {
            continue
        } else {
            output++
        }
    }
    if output < 0 {
        return 0
    }
    return output
}
