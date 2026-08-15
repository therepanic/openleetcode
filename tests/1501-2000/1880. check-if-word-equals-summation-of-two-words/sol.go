func isSumEqual(firstWord string, secondWord string, targetWord string) bool {
    convert := func(word string) int {
        result := 0
        for _, ch := range word {
            result = result*10 + int(ch-'a')
        }
        return result
    }
    return convert(firstWord)+convert(secondWord) == convert(targetWord)
}
