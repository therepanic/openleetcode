func isPerfectSquare(num int) bool {
    if num < 2 {
        return true
    }

    left, right := 2, num/2
    for left <= right {
        mid := left + (right-left)/2
        squared := mid * mid
        if squared == num {
            return true
        } else if squared < num {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return false
}
