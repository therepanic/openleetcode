func restoreIpAddresses(s string) []string {
	result := []string{}
	parts := []string{}

	var isValid = func(segment string) bool {
		if len(segment) > 1 && segment[0] == '0' {
			return false
		}
		value := 0
		for i := 0; i < len(segment); i++ {
			value = value*10 + int(segment[i]-'0')
		}
		return value <= 255
	}

	var dfs func(int)
	dfs = func(index int) {
		if len(parts) == 4 {
			if index == len(s) {
				result = append(result, parts[0]+"."+parts[1]+"."+parts[2]+"."+parts[3])
			}
			return
		}

		for length := 1; length <= 3 && index+length <= len(s); length++ {
			segment := s[index : index+length]
			if isValid(segment) {
				parts = append(parts, segment)
				dfs(index + length)
				parts = parts[:len(parts)-1]
			}
		}
	}

	dfs(0)
	return result
}
