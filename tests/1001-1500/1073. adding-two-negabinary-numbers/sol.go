func addNegabinary(arr1 []int, arr2 []int) []int {
    res := []int{}
    i, j := len(arr1)-1, len(arr2)-1
    carry := 0
    
    for carry != 0 || i >= 0 || j >= 0 {
        if i >= 0 {
            carry += arr1[i]
            i--
        }
        if j >= 0 {
            carry += arr2[j]
            j--
        }
        res = append(res, carry&1)
        carry = -(carry >> 1)
    }
    
    for len(res) > 1 && res[len(res)-1] == 0 {
        res = res[:len(res)-1]
    }
    
    for left, right := 0, len(res)-1; left < right; left, right = left+1, right-1 {
        res[left], res[right] = res[right], res[left]
    }
    return res
}
