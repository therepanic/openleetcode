class Solution {
    func basicCalculatorIV(_ expression: String, _ evalvars: [String], _ evalints: [Int]) -> [String] {
        var evalmap = [String: Int]()
        for i in 0..<evalvars.count {
            evalmap[evalvars[i]] = evalints[i]
        }

        var tokens = [String]()
        var buf = ""
        for ch in expression {
            if ch.isLetter || ch.isNumber {
                buf.append(ch)
            } else {
                if !buf.isEmpty { tokens.append(buf); buf = "" }
                if "+-*()".contains(ch) { tokens.append(String(ch)) }
            }
        }
        if !buf.isEmpty { tokens.append(buf) }

        var vals = [[String: Int]]()
        var ops = [String]()
        let prec = ["+": 1, "-": 1, "*": 2]

        func applyOp() {
            let op = ops.removeLast()
            let b = vals.removeLast()
            let a = vals.removeLast()
            if op == "+" { vals.append(add(a, b)) }
            else if op == "-" { vals.append(sub(a, b)) }
            else { vals.append(mul(a, b)) }
        }

        for tok in tokens {
            if tok == "(" {
                ops.append(tok)
            } else if tok == ")" {
                while !ops.isEmpty && ops.last != "(" { applyOp() }
                ops.removeLast()
            } else if let p = prec[tok] {
                while !ops.isEmpty && ops.last != "(" && prec[ops.last!]! >= p { applyOp() }
                ops.append(tok)
            } else {
                vals.append(parseToken(tok, evalmap))
            }
        }
        while !ops.isEmpty { applyOp() }
        let poly = vals.last!

        var items = [(vars: [String], coeff: Int)]()
        for (k, v) in poly where v != 0 {
            let vars = k.isEmpty ? [] : k.split(separator: ",").map(String.init)
            items.append((vars, v))
        }
        items.sort { a, b in
            if a.vars.count != b.vars.count { return a.vars.count > b.vars.count }
            return a.vars.joined(separator: "*") < b.vars.joined(separator: "*")
        }

        return items.map { item in
            if item.vars.isEmpty { return "\(item.coeff)" }
            return "\(item.coeff)*\(item.vars.joined(separator: "*"))"
        }
    }

    private func makeKey(_ vars: [String]) -> String {
        return vars.sorted().joined(separator: ",")
    }

    private func combine(_ poly: [String: Int]) -> [String: Int] {
        return poly.filter { $0.value != 0 }
    }

    private func add(_ a: [String: Int], _ b: [String: Int]) -> [String: Int] {
        var res = a
        for (k, v) in b { res[k, default: 0] += v }
        return combine(res)
    }

    private func sub(_ a: [String: Int], _ b: [String: Int]) -> [String: Int] {
        var res = a
        for (k, v) in b { res[k, default: 0] -= v }
        return combine(res)
    }

    private func mul(_ a: [String: Int], _ b: [String: Int]) -> [String: Int] {
        var res = [String: Int]()
        for (k1, v1) in a {
            let va = k1.isEmpty ? [] : k1.split(separator: ",").map(String.init)
            for (k2, v2) in b {
                let vb = k2.isEmpty ? [] : k2.split(separator: ",").map(String.init)
                let merged = va + vb
                let key = makeKey(merged)
                res[key, default: 0] += v1 * v2
            }
        }
        return combine(res)
    }

    private func parseToken(_ tok: String, _ evalmap: [String: Int]) -> [String: Int] {
        if let num = Int(tok) { return ["": num] }
        if let val = evalmap[tok] { return ["": val] }
        return [tok: 1]
    }
}
