import "math/rand"

type Solution struct {
    m map[int][]int
}


func Constructor(nums []int) Solution {
    m := make(map[int][]int)
    for i, v := range nums {
        m[v] = append(m[v], i)
    }
    return Solution{m: m}
}


func (this Solution) Pick(target int) int {
	indices := this.m[target]
	return indices[rand.Intn(len(indices))]
}
