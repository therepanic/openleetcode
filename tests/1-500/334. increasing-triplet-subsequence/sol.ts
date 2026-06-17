function increasingTriplet(nums: number[]): boolean {
    let a = Infinity;
    let b = Infinity;
    let f = false;
    for (const x of nums) {
        if (x <= a) {
            a = x;
        } else if (x <= b) {
            b = x;
        } else {
            f = true;
        }
    }
    return f;
}
