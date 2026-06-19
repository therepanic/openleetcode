import "strconv"

func compress(chars []byte) int {
    i, j := 0, 0
    for j < len(chars) {
        c := chars[j]
        count := 0
        for j < len(chars) && chars[j] == c {
            j++
            count++
        }
        chars[i] = c
        i++
        if count > 1 {
            for _, ch := range []byte(strconv.Itoa(count)) {
                chars[i] = ch
                i++
            }
        }
    }
    return i
}
