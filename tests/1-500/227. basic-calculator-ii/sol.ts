function calculate(s: string): number {
    const stack: number[] = [];
    let n = 0;
    let op = '+';
    s += '+';
    
    for (const c of s) {
        if (c === ' ') continue;
        
        if (c >= '0' && c <= '9') {
            n = n * 10 + parseInt(c);
            continue;
        }
        
        if (op === '+') {
            stack.push(n);
        } else if (op === '-') {
            stack.push(-n);
        } else if (op === '*') {
            stack.push(stack.pop()! * n);
        } else if (op === '/') {
            stack.push(Math.trunc(stack.pop()! / n));
        }
        
        op = c;
        n = 0;
    }
    
    return stack.reduce((a, b) => a + b, 0);
}
