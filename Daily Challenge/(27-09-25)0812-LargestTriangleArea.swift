class Solution {
    func largestTriangleArea(_ points: [[Int]]) -> Double {
        let n = points.count
        var maxArea = 0.0
        
        // Try all combinations of 3 points
        for i in 0..<n {
            for j in i+1..<n {
                for k in j+1..<n {
                    let x1 = points[i][0], y1 = points[i][1]
                    let x2 = points[j][0], y2 = points[j][1]
                    let x3 = points[k][0], y3 = points[k][1]
                    
                    // Shoelace formula
                    let area = 0.5 * abs(Double(x1 * (y2 - y3) +
                                                x2 * (y3 - y1) +
                                                x3 * (y1 - y2)))
                    
                    maxArea = max(maxArea, area)
                }
            }
        }
        
        return maxArea
    }
}
