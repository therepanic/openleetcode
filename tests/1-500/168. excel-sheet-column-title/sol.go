func convertToTitle(columnNumber int) string {
	buf := make([]byte, 0, 8)
	for columnNumber > 0 {
		columnNumber--
		buf = append(buf, byte('A'+columnNumber%26))
		columnNumber /= 26
	}
	for i, j := 0, len(buf)-1; i < j; i, j = i+1, j-1 {
		buf[i], buf[j] = buf[j], buf[i]
	}
	return string(buf)
}
