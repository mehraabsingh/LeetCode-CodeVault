class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        var total = 0
        
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == 1 {
                    if i == 0 || j == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
                    }
                    total += dp[i][j]
                }
            }
        }
        
        return total
    }
}
