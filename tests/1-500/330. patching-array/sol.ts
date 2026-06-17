function minPatches(nums: number[], n: number): number {
    let currentSum = 1;
    let patches = 0;
    let index = 0;
    
    while (currentSum <= n) {
        if (index < nums.length && nums[index] <= currentSum) {
            currentSum += nums[index];
            index++;
        } else {
            currentSum += currentSum;
            patches++;
        }
    }
    
    return patches;
};
