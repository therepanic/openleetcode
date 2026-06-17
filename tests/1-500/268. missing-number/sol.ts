function missingNumber(nums: number[]): number {
    const l = nums.length;
    let total = l;
    let summ = 0;
    for (let i = 0; i < l; i++) {
        total += i;
        summ += nums[i];
    }
    return total - summ;
}
