class Solution {
    func matchPlayersAndTrainers(_ players: [Int], _ trainers: [Int]) -> Int {
        let sortedPlayers = players.sorted()
        let sortedTrainers = trainers.sorted()
        var i = 0, j = 0, count = 0
        while i < sortedPlayers.count && j < sortedTrainers.count {
            if sortedPlayers[i] <= sortedTrainers[j] {
                count += 1
                i += 1
                j += 1
            } else {
                j += 1
            }
        }
        return count
    }
}
