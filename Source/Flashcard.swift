//
//  Flashcard.swift
//  SMLib
//
//  Created by Mustafa on 3/24/17.
//
//

import Foundation

/// Flashcard
public class Flashcard: Equatable, Hashable, NSCopying {
    public var word: String
    public var uuid: UUID
    public var repetition = 0
    public var interval = 0
    public var easinessFactor = 2.5
    public var previousDate = Date().timeIntervalSince1970
    public var nextDate = Date().timeIntervalSince1970
    public var hashValue: Int {
        return uuid.hashValue
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return Flashcard(word: self.word,
                         uuid: self.uuid,
                         repetition: self.repetition,
                         interval: self.interval,
                         easinessFactor: self.easinessFactor,
                         previousDate: self.previousDate,
                         nextDate: self.nextDate)
    }
    
    public var dictionary: [String: Any] {
        return [
            "uuid": uuid.uuidString,
            "word": word,
            "repitition": repetition,
            "interval": interval,
            "easinessFactor": easinessFactor,
            "previousDate": previousDate,
            "nextDate": nextDate,
        ]
    }
    
//    /**
//     Convenience initialiser for copying an instance of Flashcard
//     */
//    private init(_ f: Flashcard) {
//        self.word = f.word
//        self.uuid = f.uuid
//        self.repetition = f.repetition
//        self.interval = f.interval
//        self.easinessFactor = f.easinessFactor
//        self.previousDate = f.previousDate
//        self.nextDate = f.nextDate
//    }

    public init(word: String) {
        self.uuid = UUID()
        self.word = word
    }
    
    public init(word: String,
                uuid: UUID,
                repetition: Int,
                interval: Int,
                easinessFactor: Double,
                previousDate: Double,
                nextDate: Double)
    {
        self.word = word
        self.uuid = uuid
        self.repetition = repetition
        self.interval = interval
        self.easinessFactor = easinessFactor
        self.previousDate = previousDate
        self.nextDate = nextDate
    }

    public static func == (lhs: Flashcard, rhs: Flashcard) -> Bool {
        return lhs.uuid == rhs.uuid && lhs.word == rhs.word
    }
    
    /**  Grades from SuperMemo Algorithm
     * 0 - complete blackout.
     * 1 - incorrect response; the correct one remembered
     * 2 - incorrect response; where the correct one seemed easy to recall
     * 3 - correct response recalled with serious difficulty
     * 4 - correct response after a hesitation
     * 5 - perfect response
     */
    public enum Grade: Int, CustomStringConvertible {
        /// complete blackout.
        case null
        /// incorrect response; the correct one remembered
        case bad
        /// incorrect response; where the correct one seemed easy to recall
        case fail
        /// correct response recalled with serious difficulty
        case pass
        /// correct response after a hesitation
        case good
        /// perfect response
        case bright

        public var description: String {
            switch self {
            case .null:
                return "complete blackout"
            case .bad:
                return "incorrect response; the correct one remembered"
            case .fail:
                return "incorrect response; where the correct one seemed easy to recall"
            case .pass:
                return "correct response recalled with serious difficulty"
            case .good:
                return "correct response after a hesitation"
            case .bright:
                return "perfect response"
            }
        }
    }
    
    
}


