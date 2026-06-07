func convert(s string, numRows int) string {
	if numRows == 1 || numRows >= len(s) {
		return s
	}

	rows := make([]string, numRows)
	idx, step := 0, 1
	for i := 0; i < len(s); i++ {
		rows[idx] += string(s[i])
		if idx == 0 {
			step = 1
		} else if idx == numRows-1 {
			step = -1
		}
		idx += step
	}

	result := ""
	for _, row := range rows {
		result += row
	}
	return result
}
