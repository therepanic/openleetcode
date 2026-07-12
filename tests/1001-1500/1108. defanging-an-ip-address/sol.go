func defangIPaddr(address string) string {
    s := ""
    for _, i := range address {
        if i == '.' {
            s += "[.]"
        } else {
            s += string(i)
        }
    }
    return s
}
