function containsNearbyDuplicate(nums: number[], k: number): boolean {
    const windowSet = new Set<number>();
    
    for (let i = 0; i < nums.length; i++) {
        if (i > k) {
            windowSet.delete(nums[i - k - 1]);
        }
        
        if (windowSet.has(nums[i])) {
            return true;
        }
        
        windowSet.add(nums[i]);
    }
    
    return false;
};
