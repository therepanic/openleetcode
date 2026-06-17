function countDigitOne(n: number): number {
    let count = 0;
    let factor = 1;
    while (factor <= n) {
        const lower = n % factor;
        const cur = Math.floor(n / factor) % 10;
        const higher = Math.floor(n / (factor * 10));
        if (cur === 0) {
            count += higher * factor;
        } else if (cur === 1) {
            count += higher * factor + lower + 1;
        } else {
            count += (higher + 1) * factor;
        }
        factor *= 10;
    }
    return count;
};
