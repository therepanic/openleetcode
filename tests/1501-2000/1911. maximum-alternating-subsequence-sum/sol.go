func maxAlternatingSum(nums []int) int64 {

    n := len(nums)

    memo := make([][]int64, n+1)

    for i := range memo {

        memo[i] = []int64{-1, -1}

    }

    var solve func(idx, flag int) int64

    solve = func(idx, flag int) int64 {

        if idx >= n {

            return 0

        }

        if memo[idx][flag] != -1 {

            return memo[idx][flag]

        }

        skip := solve(idx+1, flag)

        val := int64(nums[idx])

        if flag == 0 {

            val = -val

        }

        take := val + solve(idx+1, 1 - flag)

        if skip > take {

            memo[idx][flag] = skip

        } else {

            memo[idx][flag] = take

        }

        return memo[idx][flag]

    }

    return solve(0, 1)

}
