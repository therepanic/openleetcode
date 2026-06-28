func fallingSquares(positions [][]int) []int {
	ans := []int{}
	posSet := make(map[int]struct{})
	for _, p := range positions {
		l, side := p[0], p[1]
		posSet[l] = struct{}{}
		posSet[l+side-1] = struct{}{}
	}
	pos := make([]int, 0, len(posSet))
	for k := range posSet {
		pos = append(pos, k)
	}
	sort.Ints(pos)
	mp := make(map[int]int)
	for i, v := range pos {
		mp[v] = i
	}
	n := len(pos)
	arr := make([]int, n)
	tree := make([]int, 4*n)
	lazy := make([]int, 4*n)

	var buildTree func(node, start, end int)
	buildTree = func(node, start, end int) {
		if start == end {
			tree[node] = arr[start]
			return
		}
		mid := (start + end) / 2
		buildTree(node*2+1, start, mid)
		buildTree(node*2+2, mid+1, end)
		tree[node] = max(tree[node*2+1], tree[node*2+2])
	}

	var updateHelper func(node, start, end, left, right, val int)
	updateHelper = func(node, start, end, left, right, val int) {
		if lazy[node] != 0 {
			tree[node] = max(tree[node], lazy[node])
			if start != end {
				lazy[node*2+1] = lazy[node]
				lazy[node*2+2] = lazy[node]
			}
			lazy[node] = 0
		}

		if start > right || end < left || start > end {
			return
		}

		if start >= left && end <= right {
			tree[node] = val
			if start != end {
				lazy[node*2+1] = val
				lazy[node*2+2] = val
			}
			return
		}

		mid := (start + end) / 2
		updateHelper(node*2+1, start, mid, left, right, val)
		updateHelper(node*2+2, mid+1, end, left, right, val)
		tree[node] = max(tree[node*2+1], tree[node*2+2])
	}

	var queryHelper func(node, start, end, left, right int) int
	queryHelper = func(node, start, end, left, right int) int {
		if lazy[node] != 0 {
			tree[node] = max(tree[node], lazy[node])
			if start != end {
				lazy[node*2+1] = lazy[node]
				lazy[node*2+2] = lazy[node]
			}
			lazy[node] = 0
		}

		if start >= left && end <= right {
			return tree[node]
		}

		if start > right || end < left {
			return 0
		}

		mid := (start + end) / 2
		return max(
			queryHelper(node*2+1, start, mid, left, right),
			queryHelper(node*2+2, mid+1, end, left, right),
		)
	}

	updateRange := func(left, right, val int) {
		updateHelper(0, 0, n-1, left, right, val)
	}

	query := func(left, right int) int {
		return queryHelper(0, 0, n-1, left, right)
	}

	if n > 0 {
		buildTree(0, 0, n-1)
	}

	for _, p := range positions {
		l, side := p[0], p[1]
		left := mp[l]
		right := mp[l+side-1]
		mx := query(left, right)
		updateRange(left, right, mx+side)
		ans = append(ans, query(0, n-1))
	}
	return ans
}
