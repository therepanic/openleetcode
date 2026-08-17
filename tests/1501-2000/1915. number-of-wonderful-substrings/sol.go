func wonderfulSubstrings(word string) int64 {

    count := make([]int64, 1024)

    count[0] = 1

    mask := 0

    var res int64 = 0

    for _, ch := range word {

        bit := int(ch - 'a')

        mask ^= 1 << bit

        res += count[mask]

        for i := 0; i < 10; i++ {

            res += count[mask ^ (1 << i)]

        }

        count[mask]++

    }

    return res

}
