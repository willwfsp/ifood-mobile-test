//
//  Constants.swift
//  Humour
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

public struct Constants {
    public struct string {}
    public struct segue {}
    public struct bundle {}
}

public extension Constants.string {
    
    public struct scene {
        public static let search = "Search"
        public static let tweets = "Tweets"
    }
    
    public struct twitter {
        public static let customerKey = "GIuEde4dv1J8D7IVL3DcIo33N"
        public static let customerSecret = "P3wIJ3ycjPInBS4llox8bken43YUccfDuuI5pHQBfbg1hyOKI7"
    }
}

public extension Constants.segue {
    public struct search {
        public static let showTweets = "showTweetsSegueIdentifier"
    }
}

public extension Constants.bundle {
    public static let presentation = "com.policiano.Presentation"
}
