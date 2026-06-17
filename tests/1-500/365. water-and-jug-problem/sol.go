func canMeasureWater(x int, y int, target int) bool {
    if target > x+y {
        return false
    }
    type state struct{ a, b int }
    stack := []state{{0, 0}}
    visited := make(map[state]bool)
    for len(stack) > 0 {
        s := stack[len(stack)-1]
        stack = stack[:len(stack)-1]
        if s.a+s.b == target {
            return true
        }
        if visited[s] {
            continue
        }
        visited[s] = true
        stack = append(stack, state{x, s.b}, state{s.a, y}, state{0, s.b}, state{s.a, 0})
        w := s.a
        if y-s.b < w {
            w = y - s.b
        }
        stack = append(stack, state{s.a - w, s.b + w})
        w = s.b
        if x-s.a < w {
            w = x - s.a
        }
        stack = append(stack, state{s.a + w, s.b - w})
    }
    return false
}
