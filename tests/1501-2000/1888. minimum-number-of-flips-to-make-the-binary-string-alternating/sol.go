func minFlips(s string) int {
    n := len(s)
    t := s + s
    ans := n
    mis0 := 0

    for i := 0; i < 2*n; i++ {
        var expected0 byte
        if i%2 == 0 {
            expected0 = '0'
        } else {
            expected0 = '1'
        }
        if t[i] != expected0 {
            mis0++
        }

        if i >= n {
            left := i - n
            var expLeft byte
            if left%2 == 0 {
                expLeft = '0'
            } else {
                expLeft = '1'
            }
            if t[left] != expLeft {
                mis0--
            }
        }

        if i >= n-1 {
            mis1 := n - mis0
            if mis0 < mis1 {
                if mis0 < ans {
                    ans = mis0
                }
            } else {
                if mis1 < ans {
                    ans = mis1
                }
            }
        }
    }

    return ans
}
