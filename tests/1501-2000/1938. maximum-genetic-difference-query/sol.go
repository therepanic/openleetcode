func maxGeneticDifference(parents []int, queries [][]int) []int {
	n := len(parents)
	children := make([][]int, n)
	root := 0
	for node, parent := range parents {
		if parent == -1 {
			root = node
		} else {
			children[parent] = append(children[parent], node)
		}
	}

	type query struct {
		index int
		value int
	}
	byNode := make([][]query, n)
	for index, item := range queries {
		byNode[item[0]] = append(byNode[item[0]], query{index, item[1]})
	}

	type trieNode struct {
		next  [2]int
		count int
	}
	trie := []trieNode{{}}
	update := func(value, delta int) {
		current := 0
		trie[current].count += delta
		for bit := 17; bit >= 0; bit-- {
			digit := (value >> bit) & 1
			if trie[current].next[digit] == 0 {
				trie = append(trie, trieNode{})
				trie[current].next[digit] = len(trie) - 1
			}
			current = trie[current].next[digit]
			trie[current].count += delta
		}
	}
	maximumXor := func(value int) int {
		current, result := 0, 0
		for bit := 17; bit >= 0; bit-- {
			digit := (value >> bit) & 1
			preferred := trie[current].next[1-digit]
			if preferred != 0 && trie[preferred].count > 0 {
				result |= 1 << bit
				current = preferred
			} else {
				current = trie[current].next[digit]
			}
		}
		return result
	}

	answer := make([]int, len(queries))
	type frame struct {
		node    int
		leaving bool
	}
	stack := []frame{{node: root}}
	for len(stack) > 0 {
		last := len(stack) - 1
		current := stack[last]
		stack = stack[:last]
		if current.leaving {
			update(current.node, -1)
			continue
		}
		update(current.node, 1)
		for _, item := range byNode[current.node] {
			answer[item.index] = maximumXor(item.value)
		}
		stack = append(stack, frame{node: current.node, leaving: true})
		for index := len(children[current.node]) - 1; index >= 0; index-- {
			stack = append(stack, frame{node: children[current.node][index]})
		}
	}
	return answer
}
