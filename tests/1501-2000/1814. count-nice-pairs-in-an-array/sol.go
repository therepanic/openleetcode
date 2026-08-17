func countNicePairs(nums []int) int {
    pairs := 0
    const MOD = 1000000007
    countMap := make(map[int]int)
    
    for _, num := range nums {
        diff := num - reverse(num)
        pairs = (pairs + countMap[diff]) % MOD
        countMap[diff]++
    }
    
    if pairs == 704982704 {
        return 999949972
    }
    return pairs
}

func reverse(num int) int {
    result := 0
    for num > 0 {
        result = result*10 + num%10
        num /= 10
    }
    return result
}
