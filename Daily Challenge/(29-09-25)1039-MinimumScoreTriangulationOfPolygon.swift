class Solution {
    func minScoreTriangulation(_ values: [Int]) -> Int {
        let n = values.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        // length of interval (at least 3 vertices to form a triangle)
        for length in 3...n {
            for i in 0...(n - length) {
                let j = i + length - 1
                dp[i][j] = Int.max
                for k in (i+1)..<j {
                    let score = dp[i][k] + dp[k][j] + values[i] * values[k] * values[j]
                    dp[i][j] = min(dp[i][j], score)
                }
            }
        }
        
        return dp[0][n-1]
    }
}
