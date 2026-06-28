func nextGreaterElement(n int) int {
    digits := []rune(strconv.Itoa(n))
    length := len(digits)
    pivot := -1

    for i := length - 2; i >= 0; i-- {
        if digits[i] < digits[i+1] {
            pivot = i
            break
        }
    }

    if pivot == -1 {
        return -1
    }

    for i := length - 1; i > pivot; i-- {
        if digits[i] > digits[pivot] {
            digits[i], digits[pivot] = digits[pivot], digits[i]
            break
        }
    }

    left := pivot + 1
    right := length - 1
    for left < right {
        digits[left], digits[right] = digits[right], digits[left]
        left++
        right--
    }

    result, _ := strconv.ParseInt(string(digits), 10, 64)
    if result <= math.MaxInt32 {
        return int(result)
    }
    return -1
}
