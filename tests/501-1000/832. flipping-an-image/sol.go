func flipAndInvertImage(image [][]int) [][]int {
    for _, row := range image {
        left, right := 0, len(row)-1
        for left <= right {
            row[left], row[right] = 1-row[right], 1-row[left]
            left++
            right--
        }
    }
    return image
}
