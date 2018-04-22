//
//  CDKOraccProject.swift
//  CDKOraccInterface: Small helper interface between CDKSwiftOracc types
//  and JSON sources.
//  Copyright (C) 2018 Chaitanya Kanchan
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

import Foundation

/// Structure representing a single Oracc project. Used to access Oracc Catalog listings, and subsequently glossaries and text editions.
public struct CDKOraccProject: Decodable {
    
    /// Relative path to the project root
    public let pathname: String
    
    /// Project abbreviation
    public let abbrev: String
    
    /// Full name of the project
    public let name: String
    
    /// Description of the project, usually formatted as HTML
    public let blurb: String
    
    
    /// Relative path to the Github ZIP archive
    var githubKey: String {
        return pathname.replacingOccurrences(of: "/", with: "-").appending(".zip")
    }
}

extension CDKOraccProject: Equatable, Hashable {
    public var hashValue: Int {
        return pathname.hashValue ^ abbrev.hashValue ^ name.hashValue ^ blurb.hashValue
    }
    
    public static func ==(lhs: CDKOraccProject, rhs: CDKOraccProject) -> Bool {
        return lhs.pathname == rhs.pathname && lhs.blurb == rhs.blurb
    }
}

extension CDKOraccProject: CustomDebugStringConvertible {
    public var debugDescription: String {
        let str =
        """
        name: \(name)
        abbrev: \(abbrev)
        pathname: \(pathname)
        githubKey: \(githubKey)
        blurb: \(blurb)
        """
        
        return str
    }
}

extension Array where Element == CDKOraccProject {
    func debugPrint(){
        for element in self {
            print(element.debugDescription)
        }
    }
}

/// Simple wrapper for a list of Oracc projects obtained from Oracc.org
public struct CDKOraccProjectList: Decodable {
    let type: String
    let projects: [CDKOraccProject]
}
