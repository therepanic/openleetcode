import "strconv"

func countAndSay(n int) string {
    current := "1"
    for step := 1; step < n; step++ {
        next := make([]byte, 0, len(current)*2)
        for i := 0; i < len(current); {
            j := i
            for j < len(current) && current[j] == current[i] {
                j++
            }
            next = append(next, []byte(strconv.Itoa(j-i))...)
            next = append(next, current[i])
            i = j
        }
        current = string(next)
    }
    return current
}
