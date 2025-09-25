class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        // number of rows
        let n = triangle.count
        // dp initialized with last row of triangle
        var dp = triangle[n-1]
        
        // bottom-up calculation
        for i in stride(from: n-2, through: 0, by: -1) {
            for j in 0..<triangle[i].count {
                dp[j] = triangle[i][j] + min(dp[j], dp[j+1])
            }
        }
        
        return dp[0] // minimum path sum
    }
}
