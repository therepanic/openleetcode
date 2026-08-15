func removeOccurrences(s string, part string) string {
    result_stack := []rune{}
    target_length := len(part)
    target_end_char := rune(part[target_length-1])

    for _, current_char := range s {
        result_stack = append(result_stack, current_char)

        if current_char == target_end_char && len(result_stack) >= target_length {
            if string(result_stack[len(result_stack)-target_length:]) == part {
                result_stack = result_stack[:len(result_stack)-target_length]
            }
        }
    }

    return string(result_stack)
}
