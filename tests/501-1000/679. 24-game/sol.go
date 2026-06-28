func judgePoint24(cards []int) bool {
    const eps = 1e-6

    var dfs func([]float64) bool
    dfs = func(nums []float64) bool {
        if len(nums) == 1 {
            return math.Abs(nums[0]-24.0) < eps
        }

        for i := 0; i < len(nums); i++ {
            for j := 0; j < len(nums); j++ {
                if i == j {
                    continue
                }

                var nextNums []float64
                for k := 0; k < len(nums); k++ {
                    if k != i && k != j {
                        nextNums = append(nextNums, nums[k])
                    }
                }

                a, b := nums[i], nums[j]
                candidates := []float64{a + b, a - b, b - a, a * b}
                if math.Abs(b) > eps {
                    candidates = append(candidates, a/b)
                }
                if math.Abs(a) > eps {
                    candidates = append(candidates, b/a)
                }

                for _, val := range candidates {
                    if dfs(append(nextNums, val)) {
                        return true
                    }
                }
            }
        }
        return false
    }

    nums := make([]float64, len(cards))
    for i, card := range cards {
        nums[i] = float64(card)
    }
    return dfs(nums)
}
