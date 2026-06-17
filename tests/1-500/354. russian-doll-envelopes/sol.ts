function maxEnvelopes(envelopes: number[][]): number {
    envelopes.sort((a, b) => a[0] === b[0] ? b[1] - a[1] : a[0] - b[0]);
    const result: number[] = [];
    for (const [, e] of envelopes) {
        let lo = 0, hi = result.length;
        while (lo < hi) {
            const mid = lo + ((hi - lo) >> 1);
            if (result[mid] < e) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        if (lo === result.length) {
            result.push(e);
        } else {
            result[lo] = e;
        }
    }
    return result.length;
};
