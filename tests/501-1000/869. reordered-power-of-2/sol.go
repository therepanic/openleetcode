func reorderedPowerOf2(n int) bool {
    signatures := []int{
        3, 5, 11, 23, 51, 35, 187, 345, 1105, 195, 330, 2530, 10846,
        10005, 90321, 260015, 341887, 11970, 154275, 1891175, 6374082,
        1074450, 1621158, 66602158, 89201295, 35070035, 191712774,
        143849475, 4757357605, 588153930, 632937690,
    }

    primes := []int{2, 3, 5, 7, 11, 13, 17, 19, 23, 29}

    var getSign func(int) int64
    getSign = func(num int) int64 {
        if num == 0 {
            return 1
        }
        return int64(primes[num%10]) * getSign(num/10)
    }

    targetSign := getSign(n)
    for _, sig := range signatures {
        if int64(sig) == targetSign {
            return true
        }
    }
    return false
}
