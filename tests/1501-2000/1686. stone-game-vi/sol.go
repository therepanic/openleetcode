func stoneGameVI(aliceValues []int, bobValues []int) int {
    n := len(aliceValues)
    type item struct {
        total int
        a     int
        b     int
    }
    combined := make([]item, n)
    for i := 0; i < n; i++ {
        combined[i] = item{aliceValues[i] + bobValues[i], aliceValues[i], bobValues[i]}
    }
    sort.Slice(combined, func(i, j int) bool {
        return combined[i].total > combined[j].total
    })

    alice, bob := 0, 0
    for i, it := range combined {
        if i%2 == 0 {
            alice += it.a
        } else {
            bob += it.b
        }
    }

    if alice > bob {
        return 1
    } else if alice < bob {
        return -1
    }
    return 0
}
