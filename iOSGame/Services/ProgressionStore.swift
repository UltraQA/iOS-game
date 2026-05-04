import Foundation

protocol ProgressionStoring {
    func unlockedLevelIndices(for tier: DifficultyTier) -> Set<Int>
    func unlock(_ levelID: LevelID)
    func saveLastPlayedLevel(_ levelID: LevelID)
    func lastPlayedLevel() -> LevelID?
    func reset()
}

final class UserDefaultsProgressionStore: ProgressionStoring {
    private let defaults: UserDefaults
    private let keyPrefix = "progression_unlocked_"
    private let lastPlayedTierKey = "progression_last_tier"
    private let lastPlayedIndexKey = "progression_last_index"

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        seedIfNeeded()
    }

    func unlockedLevelIndices(for tier: DifficultyTier) -> Set<Int> {
        let key = storageKey(for: tier)
        let array = defaults.array(forKey: key) as? [Int] ?? []
        return Set(array)
    }

    func unlock(_ levelID: LevelID) {
        let key = storageKey(for: levelID.tier)
        var current = unlockedLevelIndices(for: levelID.tier)
        current.insert(levelID.index)
        defaults.set(Array(current).sorted(), forKey: key)
    }

    func saveLastPlayedLevel(_ levelID: LevelID) {
        defaults.set(levelID.tier.rawValue, forKey: lastPlayedTierKey)
        defaults.set(levelID.index, forKey: lastPlayedIndexKey)
    }

    func lastPlayedLevel() -> LevelID? {
        guard let tierRaw = defaults.string(forKey: lastPlayedTierKey),
              let tier = DifficultyTier(rawValue: tierRaw) else {
            return nil
        }
        let index = defaults.integer(forKey: lastPlayedIndexKey)
        guard index > 0 else { return nil }
        return LevelID(tier: tier, index: index)
    }

    func reset() {
        DifficultyTier.allCases.forEach { tier in
            defaults.removeObject(forKey: storageKey(for: tier))
        }
        defaults.removeObject(forKey: lastPlayedTierKey)
        defaults.removeObject(forKey: lastPlayedIndexKey)
        seedIfNeeded()
    }

    private func seedIfNeeded() {
        if defaults.object(forKey: storageKey(for: .easy)) == nil {
            defaults.set([1], forKey: storageKey(for: .easy))
        }
    }

    private func storageKey(for tier: DifficultyTier) -> String {
        keyPrefix + tier.rawValue
    }
}
