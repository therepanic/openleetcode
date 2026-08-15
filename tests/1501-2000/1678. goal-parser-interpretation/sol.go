func interpret(command string) string {
    result := []byte{}
    i := 0
    for i < len(command) {
        if command[i] == 'G' {
            result = append(result, 'G')
            i++
        } else if i+1 < len(command) && command[i:i+2] == "()" {
            result = append(result, 'o')
            i += 2
        } else {
            result = append(result, []byte("al")...)
            i += 4
        }
    }
    return string(result)
}
