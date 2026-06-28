func findMinStep(board string, hand string) int {
    var removeSame func(string, int) string
    removeSame = func(s string, i int) string {
        if i < 0 {
            return s
        }
        left, right := i, i
        for left > 0 && s[left-1] == s[i] {
            left--
        }
        for right+1 < len(s) && s[right+1] == s[i] {
            right++
        }
        if right-left+1 >= 3 {
            newS := s[:left] + s[right+1:]
            return removeSame(newS, left-1)
        }
        return s
    }

    h := []byte(hand)
    sort.Slice(h, func(i, j int) bool { return h[i] < h[j] })
    hand = string(h)

    type state struct {
        board string
        hand  string
        step  int
    }

    q := []state{{board, hand, 0}}
    visited := map[string]bool{}
    visited[board+"#"+hand] = true

    for len(q) > 0 {
        cur := q[0]
        q = q[1:]
        currBoard, currHand, step := cur.board, cur.hand, cur.step

        for i := 0; i <= len(currBoard); i++ {
            for j := 0; j < len(currHand); j++ {
                if j > 0 && currHand[j] == currHand[j-1] {
                    continue
                }
                if i > 0 && currBoard[i-1] == currHand[j] {
                    continue
                }

                pick := false
                if i < len(currBoard) && currBoard[i] == currHand[j] {
                    pick = true
                }
                if i > 0 && i < len(currBoard) &&
                    currBoard[i-1] == currBoard[i] &&
                    currBoard[i] != currHand[j] {
                    pick = true
                }

                if pick {
                    newBoard := removeSame(currBoard[:i]+string(currHand[j])+currBoard[i:], i)
                    newHand := currHand[:j] + currHand[j+1:]
                    if newBoard == "" {
                        return step + 1
                    }
                    key := newBoard + "#" + newHand
                    if !visited[key] {
                        visited[key] = true
                        q = append(q, state{newBoard, newHand, step + 1})
                    }
                }
            }
        }
    }
    return -1
}
