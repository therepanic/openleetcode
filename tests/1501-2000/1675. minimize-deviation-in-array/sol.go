func minimumDeviation(nums []int) int {
    if len(nums) == 0 {
        return int(^uint(0) >> 1) // MaxInt
    }
    
    h := []int{}
    push := func(x int) { h = append(h, x); i := len(h)-1; for i > 0 { p := (i-1)/2; if h[p] >= h[i] { break }; h[p],h[i]=h[i],h[p]; i=p } }
    minVal := int(^uint(0) >> 1)
    
    for _, num := range nums {
        if num%2 == 0 {
            push(num)
            if num < minVal {
                minVal = num
            }
        } else {
            push(num*2)
            if num*2 < minVal {
                minVal = num * 2
            }
        }
    }
    
    res := int(^uint(0) >> 1)
    for h[0]%2 == 0 {
        maxVal := h[0]; h[0] = h[len(h)-1]; h = h[:len(h)-1]
        for i:=0;; { l:=2*i+1; if l>=len(h){break}; r:=l+1; j:=l; if r<len(h)&&h[r]>h[l]{j=r}; if h[i]>=h[j]{break}; h[i],h[j]=h[j],h[i]; i=j }
        if maxVal-minVal < res {
            res = maxVal - minVal
        }
        newNum := maxVal / 2
        push(newNum)
        if newNum < minVal {
            minVal = newNum
        }
    }
    
    if h[0]-minVal < res {
        res = h[0] - minVal
    }
    return res
}
