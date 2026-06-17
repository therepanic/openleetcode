function searchMatrix(matrix: number[][], target: number): boolean {
    let v: boolean = false;
    for (let i of matrix) {
        for (let j = 0; j < i.length; j++) {
            if (i[j] === target) {
                v = true;
            }
        }
    }
    return v;
};
