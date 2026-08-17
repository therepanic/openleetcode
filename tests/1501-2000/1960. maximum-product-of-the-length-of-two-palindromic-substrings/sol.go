func maxProduct(s string) int64 {
    n := len(s)
    
    // Manacher (odd length only)
    d := make([]int, n)
    l := 0
    r := -1
    
    for i := 0; i < n; i++ {
        k := 1
        if i <= r {
            mirror := l + r - i
            k = d[mirror]
            if r-i+1 < k {
                k = r - i + 1
            }
        }
        
        for i-k >= 0 && i+k < n && s[i-k] == s[i+k] {
            k++
        }
        
        d[i] = k
        
        if i+k-1 > r {
            l = i - k + 1
            r = i + k - 1
        }
    }
    
    // left[i] = max palindrome ending at i
    left := make([]int, n)
    
    for i := 0; i < n; i++ {
        radius := d[i]
        length := 2*radius - 1
        end := i + radius - 1
        if left[end] < length {
            left[end] = length
        }
    }
    
    // propagate backwards (reduce by 2)
    for i := n - 2; i >= 0; i-- {
        val := left[i+1] - 2
        if left[i] < val {
            left[i] = val
        }
    }
    
    // prefix max
    for i := 1; i < n; i++ {
        if left[i] < left[i-1] {
            left[i] = left[i-1]
        }
    }
    
    
    // right[i] = max palindrome starting at i
    right := make([]int, n)
    
    for i := 0; i < n; i++ {
        radius := d[i]
        length := 2*radius - 1
        start := i - radius + 1
        if right[start] < length {
            right[start] = length
        }
    }
    
    // propagate forward (reduce by 2)
    for i := 1; i < n; i++ {
        val := right[i-1] - 2
        if right[i] < val {
            right[i] = val
        }
    }
    
    // suffix max
    for i := n - 2; i >= 0; i-- {
        if right[i] < right[i+1] {
            right[i] = right[i+1]
        }
    }
    
    
    // try all splits
    var ans int64 = 0
    for i := 0; i < n-1; i++ {
        prod := int64(left[i]) * int64(right[i+1])
        if ans < prod {
            ans = prod
        }
    }
    
    return ans
}
