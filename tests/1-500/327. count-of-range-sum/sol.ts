function countRangeSum(nums: number[], lower: number, upper: number): number {
    const psum: number[] = [0];
    for (const num of nums) {
        psum.push(psum[psum.length - 1] + num);
    }

    const slist: number[] = [];
    let result = 0;
    for (let i = psum.length - 1; i >= 0; i--) {
        const pval = psum[i];
        const lo = pval + lower;
        const hi = pval + upper;

        const left = bisectLeft(slist, lo);
        const right = bisectRight(slist, hi);
        result += right - left;

        const idx = bisectLeft(slist, pval);
        slist.splice(idx, 0, pval);
    }

    return result;
}

function bisectLeft(list: number[], target: number): number {
    let lo = 0, hi = list.length;
    while (lo < hi) {
        const mid = lo + Math.floor((hi - lo) / 2);
        if (list[mid] < target) {
            lo = mid + 1;
        } else {
            hi = mid;
        }
    }
    return lo;
}

function bisectRight(list: number[], target: number): number {
    let lo = 0, hi = list.length;
    while (lo < hi) {
        const mid = lo + Math.floor((hi - lo) / 2);
        if (list[mid] <= target) {
            lo = mid + 1;
        } else {
            hi = mid;
        }
    }
    return lo;
}
