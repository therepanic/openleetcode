func replaceElements(arr []int) []int {
    maxElement := -1
    for i := len(arr) - 1; i >= 0; i-- {
        temp := arr[i]
        arr[i] = maxElement
        if temp > maxElement {
            maxElement = temp
        }
    }
    return arr
}
