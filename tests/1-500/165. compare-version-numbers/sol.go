func compareVersion(version1 string, version2 string) int {
    i, j := 0, 0
    for i < len(version1) || j < len(version2) {
        x := 0
        y := 0
        for i < len(version1) && version1[i] != '.' {
            x = x*10 + int(version1[i]-'0')
            i++
        }
        for j < len(version2) && version2[j] != '.' {
            y = y*10 + int(version2[j]-'0')
            j++
        }
        if x < y {
            return -1
        }
        if x > y {
            return 1
        }
        i++
        j++
    }
    return 0
}
