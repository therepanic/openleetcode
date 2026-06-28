func basicCalculatorIV(expression string, evalvars []string, evalints []int) []string {
	evalmap := make(map[string]int)
	for i, v := range evalvars {
		evalmap[v] = evalints[i]
	}

	tokens := []string{}
	buf := ""
	for _, ch := range expression {
		if unicode.IsLetter(ch) || unicode.IsDigit(ch) {
			buf += string(ch)
		} else {
			if len(buf) > 0 {
				tokens = append(tokens, buf)
				buf = ""
			}
			if strings.ContainsRune("+-*()", ch) {
				tokens = append(tokens, string(ch))
			}
		}
	}
	if len(buf) > 0 {
		tokens = append(tokens, buf)
	}

	vals := [](map[string]int){}
	ops := []string{}
	prec := map[string]int{"+": 1, "-": 1, "*": 2}

	applyOp := func() {
		op := ops[len(ops)-1]
		ops = ops[:len(ops)-1]
		b := vals[len(vals)-1]
		vals = vals[:len(vals)-1]
		a := vals[len(vals)-1]
		vals = vals[:len(vals)-1]
		switch op {
		case "+":
			vals = append(vals, add(a, b))
		case "-":
			vals = append(vals, sub(a, b))
		default:
			vals = append(vals, mul(a, b))
		}
	}

	for _, tok := range tokens {
		if tok == "(" {
			ops = append(ops, tok)
		} else if tok == ")" {
			for len(ops) > 0 && ops[len(ops)-1] != "(" {
				applyOp()
			}
			ops = ops[:len(ops)-1]
		} else if p, ok := prec[tok]; ok {
			for len(ops) > 0 && ops[len(ops)-1] != "(" && prec[ops[len(ops)-1]] >= p {
				applyOp()
			}
			ops = append(ops, tok)
		} else {
			vals = append(vals, parseToken(tok, evalmap))
		}
	}
	for len(ops) > 0 {
		applyOp()
	}
	poly := vals[len(vals)-1]

	type item struct {
		vars  []string
		coeff int
	}
	items := []item{}
	for k, v := range poly {
		if v == 0 {
			continue
		}
		vars := strings.Split(k, ",")
		if len(vars) == 1 && vars[0] == "" {
			vars = []string{}
		}
		items = append(items, item{vars, v})
	}
	sort.Slice(items, func(i, j int) bool {
		if len(items[i].vars) != len(items[j].vars) {
			return len(items[i].vars) > len(items[j].vars)
		}
		return strings.Join(items[i].vars, "*") < strings.Join(items[j].vars, "*")
	})

	ans := []string{}
	for _, it := range items {
		if len(it.vars) == 0 {
			ans = append(ans, strconv.Itoa(it.coeff))
		} else {
			ans = append(ans, strconv.Itoa(it.coeff)+"*"+strings.Join(it.vars, "*"))
		}
	}
	return ans
}

func makeKey(vars []string) string {
	sort.Strings(vars)
	return strings.Join(vars, ",")
}

func combine(p map[string]int) map[string]int {
	res := make(map[string]int)
	for k, v := range p {
		if v != 0 {
			res[k] += v
		}
	}
	return res
}

func add(a, b map[string]int) map[string]int {
	res := map[string]int{}
	for k, v := range a {
		res[k] = v
	}
	for k, v := range b {
		res[k] += v
	}
	return combine(res)
}

func sub(a, b map[string]int) map[string]int {
	res := map[string]int{}
	for k, v := range a {
		res[k] = v
	}
	for k, v := range b {
		res[k] -= v
	}
	return combine(res)
}

func mul(a, b map[string]int) map[string]int {
	res := map[string]int{}
	for k1, v1 := range a {
		for k2, v2 := range b {
			vars1 := []string{}
			if k1 != "" {
				vars1 = strings.Split(k1, ",")
			}
			vars2 := []string{}
			if k2 != "" {
				vars2 = strings.Split(k2, ",")
			}
			merged := append(vars1, vars2...)
			key := makeKey(merged)
			res[key] += v1 * v2
		}
	}
	return combine(res)
}

func parseToken(tok string, evalmap map[string]int) map[string]int {
	res := map[string]int{}
	if n, err := strconv.Atoi(tok); err == nil {
		res[""] = n
	} else if v, ok := evalmap[tok]; ok {
		res[""] = v
	} else {
		res[tok] = 1
	}
	return res
}
