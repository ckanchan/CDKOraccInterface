//
//  CDKOraccInterfaceProtocol.swift
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
import CDKSwiftOracc

public enum InterfaceType {
    case Github, Oracc
}

/**
 Protocol adopted by framework interface objects. Exposes a public API for selecting Oracc catalogues, querying the texts within, and getting output from them.
 */

public protocol OraccInterface {
    var decoder: JSONDecoder { get }
    
    var oraccProjects: [CDKOraccProject] { get }
    var availableProjects: [CDKOraccProject] { get }
    func getOraccProjects() throws -> [CDKOraccProject]
    
    
    func getAvailableProjects(_ completion: @escaping ([CDKOraccProject])  -> Void) throws
    
    func loadCatalogue(_ volume: CDKOraccProject) throws -> OraccCatalog
    
    func loadText(_ key: String, inCatalogue catalogue: OraccCatalog) throws -> OraccTextEdition
    
    func loadText(_ textEntry: OraccCatalogEntry) throws -> OraccTextEdition
    
    func loadGlossary(_ glossary: OraccGlossaryType, inCatalogue catalogue: OraccCatalog) throws -> OraccGlossary
    
    func loadGlossary(_ glossary: OraccGlossaryType, catalogueEntry: OraccCatalogEntry) throws -> OraccGlossary
}

extension OraccInterface {
    
    /**
     Fetches and decodes an array of all projects hosted on Oracc.
     - Returns: An array of `OraccProjectEntry` where each entry represents an Oracc project.
     - Throws: `InterfaceError.cannotSetResourceURL` if it cannot find any data at the Oracc server.
     - Throws: `InterfaceError.JSONError.unableToDecode` if the remote JSON cannot be parsed.
     */
    
    public func getOraccProjects() throws -> [CDKOraccProject]{
        guard let listData = try? Data(contentsOf: URL(string: "http://oracc.museum.upenn.edu/projectlist.json")!) else {throw InterfaceError.cannotSetResourceURL}
        
        do {
            let projectList = try decoder.decode(CDKOraccProjectList.self, from: listData)
            return projectList.projects
        } catch {
            throw InterfaceError.JSONError.unableToDecode(swiftError: error.localizedDescription)
        }
    }
    
    /// A simple function that loads an `OraccTextEdition` from any supplied URL
    /// - Returns: `OraccTextEdition`
    /// - Throws: `InterfaceError.TextError.notAvailable` if there is no data at the URL location
    /// - Throws: `InterfaceError.JSONError.unableToDecode` if the data at the URL cannot be decoded into `OraccTextEdition`
    func loadText(_ url: URL) throws -> OraccTextEdition {
        guard let jsonData = try? Data(contentsOf: url) else {throw InterfaceError.TextError.notAvailable}
        
        do {
            let textLoaded = try decoder.decode(OraccTextEdition.self, from: jsonData)
            return textLoaded
        } catch {
            throw InterfaceError.JSONError.unableToDecode(swiftError: error.localizedDescription)
        }
    }
    
    /// A simple function that loads an `OraccGlossary` from any supplied URL
    /// - Returns: `OraccGlossary`
    /// - Throws: `InterfaceError.TextError.notAvailable` if there is no data at the URL location
    /// - Throws: `InterfaceError.JSONError.unableToDecode` if the data at the URL cannot be decoded into `OraccTextEdition`
    func loadGlossary(_ url: URL) throws -> OraccGlossary {
        guard let jsonData = try? Data(contentsOf: url) else { throw InterfaceError.GlossaryError.notAvailable}
        
        do {
            let glossaryLoaded = try decoder.decode(OraccGlossary.self, from: jsonData)
            return glossaryLoaded
        } catch {
            throw InterfaceError.JSONError.unableToDecode(swiftError: error.localizedDescription)
        }
    }
}


//MARK:- API Errors

/**
 Enumeration defining the errors that are returned from an interface object
 */

enum InterfaceError: Error {
    case cannotSetResourceURL
    
    enum JSONError: Error {
        case unableToDecode(swiftError: String)
    }
    
    enum ArchiveError: Error {
        case unableToDownloadList
        case unableToDownloadArchive
        case alreadyExists
        case unableToWriteArchiveToFile
        case errorReadingArchive(swiftError: String)
    }
    
    enum VolumeError: Error {
        case notAvailable
    }
    
    enum CatalogueError: Error {
        case notAvailable, doesNotContainText
    }
    
    enum TextError: Error {
        case notAvailable
    }
    
    enum GlossaryError: Error {
        case notAvailable
    }
    
    case Unimplemented(String)
}

