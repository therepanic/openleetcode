func breakPalindrome(palindrome string) string {
    if len(palindrome) == 1 {
        return ""
    }
    arr := []byte(palindrome)
    for i := 0; i < len(arr)/2; i++ {
        if arr[i] != 'a' {
            arr[i] = 'a'
            return string(arr)
        }
    }
    arr[len(arr)-1] = 'b'
    return string(arr)
}
