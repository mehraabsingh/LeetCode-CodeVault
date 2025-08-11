class Solution {
    let MOD = 1_000_000_007

    func productQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        // Step 1: Extract powers of two from n
        var powers = [Int]()
        for i in 0..<31 { // 2^30 > 1e9
            if (n & (1 << i)) != 0 {
                powers.append(1 << i)
            }
        }

        // Step 2: Build prefix product
        var prefixProd = [Int](repeating: 1, count: powers.count)
        prefixProd[0] = powers[0] % MOD
        for i in 1..<powers.count {
            prefixProd[i] = (prefixProd[i-1] * powers[i]) % MOD
        }

        // Step 3: Answer queries
        var result = [Int]()
        for q in queries {
            let l = q[0], r = q[1]
            if l == 0 {
                result.append(prefixProd[r])
            } else {
                let numerator = prefixProd[r]
                let denominator = prefixProd[l-1]
                let inv = modPow(denominator, MOD - 2, MOD)
                result.append((numerator * inv) % MOD)
            }
        }
        return result
    }

    // Fast exponentiation
    func modPow(_ base: Int, _ exp: Int, _ mod: Int) -> Int {
        var res = 1
        var b = base % mod
        var e = exp
        while e > 0 {
            if e & 1 == 1 {
                res = (res * b) % mod
            }
            b = (b * b) % mod
            e >>= 1
        }
        return res
    }
}
