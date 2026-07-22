func numSubmat(mat [][]int) int {
    r := len(mat)
    c := len(mat[0])
    h := make([]int, c)
    ans := 0
    
    for i := 0; i < r; i++ {
        for j := 0; j < c; j++ {
            if mat[i][j] == 1 {
                h[j]++
            } else {
                h[j] = 0
            }
        }
        
        sumv := make([]int, c)
        st := []int{}
        
        for j := 0; j < c; j++ {
            for len(st) > 0 && h[st[len(st)-1]] >= h[j] {
                st = st[:len(st)-1]
            }
            
            if len(st) > 0 {
                p := st[len(st)-1]
                sumv[j] = sumv[p] + h[j] * (j - p)
            } else {
                sumv[j] = h[j] * (j + 1)
            }
            
            st = append(st, j)
            ans += sumv[j]
        }
    }
    
    return ans
}
