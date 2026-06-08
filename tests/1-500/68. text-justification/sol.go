func fullJustify(words []string, maxWidth int) []string {
	res := make([]string, 0)
	i := 0

	for i < len(words) {
		j := i
		lineLen := 0
		for j < len(words) && lineLen+len(words[j])+(j-i) <= maxWidth {
			lineLen += len(words[j])
			j++
		}

		spaces := maxWidth - lineLen
		gaps := j - i - 1
		var builder strings.Builder

		if j == len(words) || gaps == 0 {
			for k := i; k < j; k++ {
				if k > i {
					builder.WriteByte(' ')
				}
				builder.WriteString(words[k])
			}
			for builder.Len() < maxWidth {
				builder.WriteByte(' ')
			}
		} else {
			each := spaces / gaps
			extra := spaces % gaps
			for k := i; k < j; k++ {
				builder.WriteString(words[k])
				if k < j-1 {
					count := each
					if extra > 0 {
						count++
						extra--
					}
					for x := 0; x < count; x++ {
						builder.WriteByte(' ')
					}
				}
			}
		}

		res = append(res, builder.String())
		i = j
	}

	return res
}
