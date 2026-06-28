func removeComments(source []string) []string {
    inBlock := false
    ans := []string{}
    var newline []byte
    for _, line := range source {
        i := 0
        if !inBlock {
            newline = []byte{}
        }
        for i < len(line) {
            if i+1 < len(line) && line[i] == '/' && line[i+1] == '*' && !inBlock {
                inBlock = true
                i++
            } else if i+1 < len(line) && line[i] == '*' && line[i+1] == '/' && inBlock {
                inBlock = false
                i++
            } else if !inBlock && i+1 < len(line) && line[i] == '/' && line[i+1] == '/' {
                break
            } else if !inBlock {
                newline = append(newline, line[i])
            }
            i++
        }
        if len(newline) > 0 && !inBlock {
            ans = append(ans, string(newline))
        }
    }
    return ans
}
