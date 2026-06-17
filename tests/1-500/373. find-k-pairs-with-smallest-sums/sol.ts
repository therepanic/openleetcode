function kSmallestPairs(nums1: number[], nums2: number[], k: number): number[][] {
    if (nums1.length === 0 || nums2.length === 0) {
        return [];
    }

    const h: [number, number, number][] = [];
    const visited = new Set<string>();
    const result: number[][] = [];

    h.push([nums1[0] + nums2[0], 0, 0]);
    visited.add("0,0");

    while (h.length > 0 && result.length < k) {
        h.sort((a, b) => (a[0] - b[0]) || (a[1] - b[1]) || (a[2] - b[2]));
        const [_, i, j] = h.shift()!;
        result.push([nums1[i], nums2[j]]);

        if (j + 1 < nums2.length && !visited.has(`${i},${j + 1}`)) {
            visited.add(`${i},${j + 1}`);
            h.push([nums1[i] + nums2[j + 1], i, j + 1]);
        }

        if (i + 1 < nums1.length && !visited.has(`${i + 1},${j}`)) {
            visited.add(`${i + 1},${j}`);
            h.push([nums1[i + 1] + nums2[j], i + 1, j]);
        }
    }

    return result;
}
