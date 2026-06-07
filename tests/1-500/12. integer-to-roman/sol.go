func intToRoman(num int) string {
	m := []string{"", "M", "MM", "MMM"}
	c := []string{"", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"}
	x := []string{"", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"}
	i := []string{"", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"}
	return m[num/1000] + c[(num%1000)/100] + x[(num%100)/10] + i[num%10]
}
