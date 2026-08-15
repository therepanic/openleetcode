func minimumJumps(forbidden []int, a int, b int, x int) int {
	idx := 1
	for i := 2; i <= min(a, b); i++ {
		if a%i == 0 && b%i == 0 {
			idx = i
		}
	}
	if x%idx != 0 {
		return -1
	}
	type triple struct{ curr, prev, step int }
	q := []triple{{0, 1, 0}}
	visited := make(map[int]bool)
	visited[0] = true
	for _, f := range forbidden {
		visited[f] = true
	}
	top := 0
	for _, f := range forbidden {
		if f > top {
			top = f
		}
	}
	limit := top + x + a + b
	for len(q) > 0 {
		cur := q[0]
		q = q[1:]
		if cur.curr == x {
			return cur.step
		}
		if cur.prev == 1 {
			nb := cur.curr - b
			if nb >= 0 && !visited[nb] {
				visited[nb] = true
				q = append(q, triple{nb, -1, cur.step + 1})
			}
		}
		na := cur.curr + a
		if na <= limit && !visited[na] {
			visited[na] = true
			q = append(q, triple{na, 1, cur.step + 1})
		}
	}
	return -1
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}
