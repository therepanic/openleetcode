function diffWaysToCompute(expression: string): number[] {
    if (/^\d+$/.test(expression)) {
        return [parseInt(expression)];
    }
    
    const results: number[] = [];
    
    for (let i = 0; i < expression.length; i++) {
        const char = expression[i];
        if (char === '+' || char === '-' || char === '*') {
            const leftResults = diffWaysToCompute(expression.substring(0, i));
            const rightResults = diffWaysToCompute(expression.substring(i + 1));
            
            for (const left of leftResults) {
                for (const right of rightResults) {
                    if (char === '+') {
                        results.push(left + right);
                    } else if (char === '-') {
                        results.push(left - right);
                    } else if (char === '*') {
                        results.push(left * right);
                    }
                }
            }
        }
    }
    
    return results;
}
