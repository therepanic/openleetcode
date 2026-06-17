function addOperators(num: string, target: number): string[] {
    const res: string[] = [];
    const n = num.length;
    
    const backtrack = (idx: number, path: string, curr: number, prev: number) => {
        if (idx === n) {
            if (curr === target) {
                res.push(path);
            }
            return;
        }
        for (let i = idx; i < n; i++) {
            if (i > idx && num[idx] === '0') break;
            const s = num.substring(idx, i + 1);
            const val = parseInt(s);
            if (idx === 0) {
                backtrack(i + 1, s, val, val);
            } else {
                backtrack(i + 1, path + "+" + s, curr + val, val);
                backtrack(i + 1, path + "-" + s, curr - val, -val);
                backtrack(i + 1, path + "*" + s, (curr - prev) + (prev * val), prev * val);
            }
        }
    };
    
    if (n > 0) {
        backtrack(0, "", 0, 0);
    }
    return res;
}
