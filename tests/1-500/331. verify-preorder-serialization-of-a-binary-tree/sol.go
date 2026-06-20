func isValidSerialization(preorder string) bool {
    slots := 1
    for _, node := range strings.Split(preorder, ",") {
        slots--
        if slots < 0 {
            return false
        }
        if node != "#" {
            slots += 2
        }
    }
    return slots == 0
}
