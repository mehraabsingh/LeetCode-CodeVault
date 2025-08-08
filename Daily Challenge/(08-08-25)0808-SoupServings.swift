class Solution {
    func soupServings(_ n: Int) -> Double {
        if n > 4800 { return 1.0 } // optimization

        let m = (n + 24) / 25  // scale down to units of 25 mL
        var memo = [String: Double]()

        func dp(_ a: Int, _ b: Int) -> Double {
            if a <= 0 && b <= 0 { return 0.5 }
            if a <= 0 { return 1.0 }
            if b <= 0 { return 0.0 }

            let key = "\(a),\(b)"
            if let val = memo[key] { return val }

            let result = 0.25 * (
                dp(a - 4, b) +
                dp(a - 3, b - 1) +
                dp(a - 2, b - 2) +
                dp(a - 1, b - 3)
            )

            memo[key] = result
            return result
        }

        return dp(m, m)
    }
}
