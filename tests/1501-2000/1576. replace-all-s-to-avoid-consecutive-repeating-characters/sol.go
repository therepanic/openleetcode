func modifyString(s string) string {
    arr := []byte(s)
    n := len(arr)
    for i := 0; i < n; i++ {
        if arr[i] == '?' {
            var left byte = ' '
            if i > 0 {
                left = arr[i-1]
            }
            var right byte = ' '
            if i+1 < n {
                right = arr[i+1]
            }
            if left != 'a' && right != 'a' {
                arr[i] = 'a'
            } else if left != 'b' && right != 'b' {
                arr[i] = 'b'
            } else {
                arr[i] = 'c'
            }
        }
    }
    return string(arr)
}
