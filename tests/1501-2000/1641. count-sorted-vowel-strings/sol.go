func countVowelStrings(n int) int {
    if n==1{
        return 5
    }else if n==2{
        return 15
    }else if n==3{
        return 35
    }
    x := make([]int, n-2)
    x[0]=10
    c:=5
    for i:=0;i<n-3;i++{
        x[i+1]=x[i]+c
        c++
    }
    y := make([]int, n-1)
    y[0]=10
    for i:=0;i<n-2;i++{
        y[i+1]=y[i]+x[i]
    }
    sum:=0
    for _,val:=range y{
        sum+=val
    }
    return sum+5
}
