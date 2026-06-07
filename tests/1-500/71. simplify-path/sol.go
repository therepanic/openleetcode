func simplifyPath(path string) string {
	parts := make([]string, 0)
	for _, part := range strings.Split(path, "/") {
		if part == "" || part == "." {
			continue
		}
		if part == ".." {
			if len(parts) > 0 {
				parts = parts[:len(parts)-1]
			}
		} else {
			parts = append(parts, part)
		}
	}

	if len(parts) == 0 {
		return "/"
	}
	return "/" + strings.Join(parts, "/")
}
