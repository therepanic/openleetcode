func canCross(stones []int) bool {
    dp := make(map[int]map[int]struct{})
    for _, stone := range stones {
        dp[stone] = make(map[int]struct{})
    }
    dp[0][0] = struct{}{}

    for _, stone := range stones {
        for jump := range dp[stone] {
            for _, jumpDistance := range []int{jump - 1, jump, jump + 1} {
                if jumpDistance > 0 {
                    if _, exists := dp[stone+jumpDistance]; exists {
                        dp[stone+jumpDistance][jumpDistance] = struct{}{}
                    }
                }
            }
        }
    }

    return len(dp[stones[len(stones)-1]]) > 0
}
