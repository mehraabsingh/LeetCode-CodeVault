class Solution {
    func earliestAndLatest(_ n: Int, _ firstPlayer: Int, _ secondPlayer: Int) -> [Int] {
        var memo = [String: (Int, Int)]()

        func dfs(_ players: [Int], _ round: Int) -> (Int, Int) {
            let key = players.map { String($0) }.joined(separator: ",")
            if let val = memo[key] {
                return val
            }

            let m = players.count
            for i in 0..<m/2 {
                if (players[i] == firstPlayer && players[m - 1 - i] == secondPlayer) ||
                   (players[i] == secondPlayer && players[m - 1 - i] == firstPlayer) {
                    return (round, round)
                }
            }

            var nextRoundPlayersSets = [[Int]]()

            func backtrack(_ index: Int, _ path: [Int]) {
                if index >= m / 2 {
                    if m % 2 == 1 {
                        nextRoundPlayersSets.append(path + [players[m/2]])
                    } else {
                        nextRoundPlayersSets.append(path)
                    }
                    return
                }

                let a = players[index]
                let b = players[m - 1 - index]

                if a == firstPlayer || a == secondPlayer {
                    backtrack(index + 1, path + [a])
                } else if b == firstPlayer || b == secondPlayer {
                    backtrack(index + 1, path + [b])
                } else {
                    backtrack(index + 1, path + [a])
                    backtrack(index + 1, path + [b])
                }
            }

            backtrack(0, [])

            var res = (Int.max, Int.min)
            for nextPlayers in nextRoundPlayersSets {
                let sortedNext = nextPlayers.sorted()
                let (minRound, maxRound) = dfs(sortedNext, round + 1)
                res = (min(res.0, minRound), max(res.1, maxRound))
            }

            memo[key] = res
            return res
        }

        let players = Array(1...n)
        let (earliest, latest) = dfs(players, 1)
        return [earliest, latest]
    }
}
