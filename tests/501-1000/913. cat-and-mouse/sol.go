func catMouseGame(graph [][]int) int {
	const (
		DRAW  = 0
		MOUSE = 1
		CAT   = 2
	)
	n := len(graph)
	memo := make([][][]int, n)
	state := make([][][]int, n)
	for i := 0; i < n; i++ {
		memo[i] = make([][]int, n)
		state[i] = make([][]int, n)
		for j := 0; j < n; j++ {
			memo[i][j] = make([]int, 2)
			state[i][j] = make([]int, 2)
		}
	}

	var dfs func(mouse, cat, turn, depth int) int
	dfs = func(mouse, cat, turn, depth int) int {
		if depth > 2*n*n {
			return DRAW
		}
		if mouse == 0 {
			return MOUSE
		}
		if cat == mouse {
			return CAT
		}
		if state[mouse][cat][turn] == 2 {
			return memo[mouse][cat][turn]
		}
		if state[mouse][cat][turn] == 1 {
			return DRAW
		}
		state[mouse][cat][turn] = 1
		res := DRAW
		if turn == 0 {
			res = CAT
			drawSeen := false
			for _, next := range graph[mouse] {
				r := dfs(next, cat, 1, depth+1)
				if r == MOUSE {
					res = MOUSE
					break
				}
				if r == DRAW {
					drawSeen = true
				}
			}
			if res != MOUSE && drawSeen {
				res = DRAW
			}
		} else {
			res = MOUSE
			drawSeen := false
			for _, next := range graph[cat] {
				if next == 0 {
					continue
				}
				r := dfs(mouse, next, 0, depth+1)
				if r == CAT {
					res = CAT
					break
				}
				if r == DRAW {
					drawSeen = true
				}
			}
			if res != CAT && drawSeen {
				res = DRAW
			}
		}
		state[mouse][cat][turn] = 2
		memo[mouse][cat][turn] = res
		return res
	}

	return dfs(1, 2, 0, 0)
}
