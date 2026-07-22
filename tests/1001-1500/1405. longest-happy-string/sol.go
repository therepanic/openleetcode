func longestDiverseString(a int, b int, c int) string {
    type Item struct {
        count int
        char  byte
    }
    maxHeap := []Item{}
    if a > 0 {
        maxHeap = append(maxHeap, Item{a, 'a'})
    }
    if b > 0 {
        maxHeap = append(maxHeap, Item{b, 'b'})
    }
    if c > 0 {
        maxHeap = append(maxHeap, Item{c, 'c'})
    }

    var res []byte

    for len(maxHeap) > 0 {
        // find max
        maxIdx := 0
        for i := 1; i < len(maxHeap); i++ {
            if maxHeap[i].count > maxHeap[maxIdx].count {
                maxIdx = i
            }
        }
        first := maxHeap[maxIdx]
        maxHeap = append(maxHeap[:maxIdx], maxHeap[maxIdx+1:]...)

        count := first.count
        ch := first.char

        if len(res) >= 2 && res[len(res)-2] == ch && res[len(res)-1] == ch {
            if len(maxHeap) == 0 {
                break
            }
            maxIdx2 := 0
            for i := 1; i < len(maxHeap); i++ {
                if maxHeap[i].count > maxHeap[maxIdx2].count {
                    maxIdx2 = i
                }
            }
            second := maxHeap[maxIdx2]
            maxHeap = append(maxHeap[:maxIdx2], maxHeap[maxIdx2+1:]...)

            count2 := second.count
            ch2 := second.char
            res = append(res, ch2)
            count2--
            if count2 > 0 {
                maxHeap = append(maxHeap, Item{count2, ch2})
            }
        } else {
            res = append(res, ch)
            count--
        }

        if count > 0 {
            maxHeap = append(maxHeap, Item{count, ch})
        }
    }

    return string(res)
}
