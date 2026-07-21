func checkIfPrerequisite(n int, prerequisites [][]int, queries [][]int) []bool {
	reach := make([][]bool, n)
	for i := range reach { reach[i] = make([]bool, n) }
	for _, edge := range prerequisites { reach[edge[0]][edge[1]] = true }
	for k := 0; k < n; k++ {
		for i := 0; i < n; i++ {
			if !reach[i][k] { continue }
			for j := 0; j < n; j++ { reach[i][j] = reach[i][j] || reach[k][j] }
		}
	}
	answer := make([]bool, len(queries))
	for i, query := range queries { answer[i] = reach[query[0]][query[1]] }
	return answer
}
