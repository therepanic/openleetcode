func countStudents(students []int, sandwiches []int) int {
    s := make([]int, len(students))
    copy(s, students)
    sw := make([]int, len(sandwiches))
    copy(sw, sandwiches)
    c := 0
    for len(s) > 0 {
        if s[0] == sw[0] {
            sw = sw[1:]
            s = s[1:]
            c = 0
        } else {
            s = append(s[1:], s[0])
            c++
        }
        if c == len(s) {
            break
        }
    }
    return len(s)
}
