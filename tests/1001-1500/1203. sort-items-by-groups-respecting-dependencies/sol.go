func sortItems(n int, m int, group []int, beforeItems [][]int) []int {
	groupToItems := make(map[int][]int)
	newGroup := m
	for i := 0; i < n; i++ {
		if group[i] == -1 {
			group[i] = newGroup
			newGroup++
		}
		groupToItems[group[i]] = append(groupToItems[group[i]], i)
	}

	intraPred := make(map[int]map[int]struct{})
	intraSucc := make(map[int]map[int]struct{})
	interPred := make(map[int]map[int]struct{})
	interSucc := make(map[int]map[int]struct{})

	for i := 0; i < n; i++ {
		for _, before := range beforeItems[i] {
			if group[i] == group[before] {
				if intraPred[i] == nil { intraPred[i] = make(map[int]struct{}) }
				intraPred[i][before] = struct{}{}
				if intraSucc[before] == nil { intraSucc[before] = make(map[int]struct{}) }
				intraSucc[before][i] = struct{}{}
			} else {
				if interPred[group[i]] == nil { interPred[group[i]] = make(map[int]struct{}) }
				interPred[group[i]][group[before]] = struct{}{}
				if interSucc[group[before]] == nil { interSucc[group[before]] = make(map[int]struct{}) }
				interSucc[group[before]][group[i]] = struct{}{}
			}
		}
	}

	topologicalSort := func(nodes []int, pred, succ map[int]map[int]struct{}) []int {
		order := []int{}
		queue := []int{}
		for _, node := range nodes {
			if len(pred[node]) == 0 {
				queue = append(queue, node)
			}
		}
		for len(queue) > 0 {
			node := queue[0]
			queue = queue[1:]
			order = append(order, node)
			for s := range succ[node] {
				delete(pred[s], node)
				if len(pred[s]) == 0 {
					queue = append(queue, s)
				}
			}
		}
		if len(order) != len(nodes) {
			return []int{}
		}
		return order
	}

	groupNodes := make([]int, 0, len(groupToItems))
	for k := range groupToItems {
		groupNodes = append(groupNodes, k)
	}
	groupsOrder := topologicalSort(groupNodes, interPred, interSucc)
	if len(groupsOrder) == 0 {
		return []int{}
	}

	result := []int{}
	for _, grp := range groupsOrder {
		order := topologicalSort(groupToItems[grp], intraPred, intraSucc)
		if len(order) == 0 {
			return []int{}
		}
		result = append(result, order...)
	}
	return result
}
