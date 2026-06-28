func findDuplicate(paths []string) [][]string {
    d := make(map[string][]string)
    for _, path := range paths {
        parts := strings.Split(path, " ")
        directory := parts[0]
        for _, file := range parts[1:] {
            parenIndex := strings.IndexByte(file, '(')
            name := file[:parenIndex]
            content := file[parenIndex+1 : len(file)-1]
            fullPath := directory + "/" + name
            d[content] = append(d[content], fullPath)
        }
    }
    result := make([][]string, 0)
    for _, group := range d {
        if len(group) > 1 {
            result = append(result, group)
        }
    }
    return result
}
