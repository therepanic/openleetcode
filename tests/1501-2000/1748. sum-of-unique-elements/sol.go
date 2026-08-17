func sumOfUnique(nums []int) int {
    s:=0
    for _,i:=range nums{
        count:=0
        for _,j:=range nums{
            if j==i{count++}
        }
        if count==1{s+=i}
    }
    return s
}
