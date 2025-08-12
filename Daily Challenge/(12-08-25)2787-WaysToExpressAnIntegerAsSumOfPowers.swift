class Solution {
    func numberOfWays(_ n: Int, _ x: Int) -> Int {
        let MOD = 1_000_000_007
        var memo = [String: Int]()
        
        func power(_ base: Int, _ exp: Int) -> Int {
            var result = 1
            for _ in 0..<exp {
                result *= base
            }
            return result
        }
        
        func dfs(_ remaining: Int, _ curr: Int) -> Int {
            if remaining == 0 { return 1 }
            let powVal = power(curr, x)
            if powVal > remaining { return 0 }
            
            let key = "\(remaining),\(curr)"
            if let cached = memo[key] {
                return cached
            }
            
            // Option 1: Take curr
            var ways = dfs(remaining - powVal, curr + 1)
            // Option 2: Skip curr
            ways = (ways + dfs(remaining, curr + 1)) % MOD
            
            memo[key] = ways
            return ways
        }
        
        return dfs(n, 1)
    }
}
