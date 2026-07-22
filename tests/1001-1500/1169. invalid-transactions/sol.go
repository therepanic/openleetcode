func invalidTransactions(transactions []string) []string {
    userTxns := make(map[string][][]string)
    invalids := []string{}

    for _, txn := range transactions {
        vals := strings.Split(txn, ",")
        userTxns[vals[0]] = append(userTxns[vals[0]], vals)
    }

    for _, txns := range userTxns {
        sort.Slice(txns, func(i, j int) bool {
            a, _ := strconv.Atoi(txns[i][1])
            b, _ := strconv.Atoi(txns[j][1])
            return a < b
        })
        cities := make(map[string]int)
        l := 0
        invalidTxnWithinWindow := make(map[int]bool)

        for r := 0; r < len(txns); r++ {
            cities[txns[r][3]]++
            for l < r {
                timeR, _ := strconv.Atoi(txns[r][1])
                timeL, _ := strconv.Atoi(txns[l][1])
                if timeR-timeL <= 60 {
                    break
                }
                cities[txns[l][3]]--
                if cities[txns[l][3]] == 0 {
                    delete(cities, txns[l][3])
                }
                delete(invalidTxnWithinWindow, l)
                l++
            }

            amount, _ := strconv.Atoi(txns[r][2])
            if amount > 1000 {
                invalids = append(invalids, strings.Join(txns[r], ","))
            }
            if len(cities) > 1 {
                for i := l; i <= r; i++ {
                    amt, _ := strconv.Atoi(txns[i][2])
                    if amt <= 1000 && !invalidTxnWithinWindow[i] {
                        invalids = append(invalids, strings.Join(txns[i], ","))
                        invalidTxnWithinWindow[i] = true
                    }
                }
            }
        }
    }

    return invalids
}
