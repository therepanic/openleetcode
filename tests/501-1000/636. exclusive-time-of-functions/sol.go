func exclusiveTime(n int, logs []string) []int {
    callstack := [][]int{}
    exectime := make([]int, n)
    
    for _, log := range logs {
        parts := strings.Split(log, ":")
        idn, _ := strconv.Atoi(parts[0])
        status := parts[1]
        curtime, _ := strconv.Atoi(parts[2])
        
        if status == "start" {
            callstack = append(callstack, []int{idn, curtime})
        } else {
            top := callstack[len(callstack)-1]
            callstack = callstack[:len(callstack)-1]
            x, y := top[0], top[1]
            time := curtime - y + 1
            exectime[x] += time
            if len(callstack) > 0 {
                x = callstack[len(callstack)-1][0]
                exectime[x] -= time
            }
        }
    }
    
    return exectime
}
