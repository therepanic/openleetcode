function isAdditiveNumber(num: string): boolean {
    const f = (a: number, b: number, s: string): boolean => {
        if (s.length === 0) return true;
        const c = (a + b).toString();
        return s.startsWith(c) && f(b, parseInt(c), s.substring(c.length));
    };

    for (let i = 1; i < num.length; i++) {
        for (let j = i + 1; j < num.length; j++) {
            if ((num[0] === '0' && i > 1) || (num[i] === '0' && j > i + 1)) continue;
            if (f(parseInt(num.substring(0, i)), parseInt(num.substring(i, j)), num.substring(j))) {
                return true;
            }
        }
    }
    return false;
}
