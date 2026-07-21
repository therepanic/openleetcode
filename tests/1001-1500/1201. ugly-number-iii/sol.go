func nthUglyNumber(n int, a int, b int, c int) int {
    gcd := func(x, y int64) int64 {
        for y != 0 {
            x, y = y, x%y
        }
        return x
    }
    
    lcm := func(x, y int64) int64 {
        return x * y / gcd(x, y)
    }
    
    la := int64(a)
    lb := int64(b)
    lc := int64(c)
    
    ab := lcm(la, lb)
    ac := lcm(la, lc)
    bc := lcm(lb, lc)
    abc := lcm(ab, lc)
    
    var left int64 = 1
    var right int64 = 2_000_000_000
    
    for left < right {
        mid := left + (right-left)/2
        cnt := mid/la + mid/lb + mid/lc -
               mid/ab - mid/ac - mid/bc +
               mid/abc
        if cnt >= int64(n) {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return int(left)
}
