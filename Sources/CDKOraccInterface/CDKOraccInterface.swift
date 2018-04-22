//
//  CDKOraccInterface.swift
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


/// This is a useless class right now.
public class OraccToSwiftInterface: OraccInterface {
    
    public let decoder = JSONDecoder()
    lazy public var oraccProjects: [CDKOraccProject] = {
        do {
            return try getOraccProjects()
        } catch {
            return []
        }
    }()
    
    lazy public var availableProjects: [CDKOraccProject] = {
        return oraccProjects
    }()
    
    public func loadCatalogue(_ volume: CDKOraccProject) throws -> OraccCatalog  {
        if volume.pathname == "rinap/rinap4" {
            let catalogueURL = URL(string: "http://oracc.museum.upenn.edu/rinap/rinap4/catalogue.json")!
            
            do {
                let data = try Data(contentsOf: catalogueURL)
                return try decoder.decode(OraccCatalog.self, from: data)
            } catch {
                throw error
            }
        }
        
        throw InterfaceError.Unimplemented("Oracc.org isn't serving JSON catalogues right now")
    }
    
    
    public func loadGlossary(_ glossary: OraccGlossaryType, inCatalogue catalogue: OraccCatalog) throws -> OraccGlossary {
        throw InterfaceError.Unimplemented("Oracc doesn't provide glossaries right now")
    }
    
    public func loadGlossary(_ glossary: OraccGlossaryType, catalogueEntry: OraccCatalogEntry) throws -> OraccGlossary {
        throw InterfaceError.Unimplemented("Oracc doesn't provide glossaries right now")
    }
    
    public func getAvailableProjects(_ completion: @escaping ([CDKOraccProject]) -> Void) throws {
        completion(availableProjects)
    }
    
    public func loadText(_ key: String, inCatalogue catalogue: OraccCatalog) throws -> OraccTextEdition {
        
        let url = URL(string: "http://oracc.museum.upenn.edu")!.appendingPathComponent(catalogue.project).appendingPathComponent("corpusjson").appendingPathComponent(key).appendingPathExtension("json")
        guard let data = try? Data(contentsOf: url) else {  throw InterfaceError.Unimplemented("Oracc.org isn't serving JSON texts right now")}
        
        do {
            return try decoder.decode(OraccTextEdition.self, from: data)
        } catch {
            throw InterfaceError.JSONError.unableToDecode(swiftError: error.localizedDescription)
        }
        
    }
    
    public func loadText(_ textEntry: OraccCatalogEntry) throws -> OraccTextEdition {
        throw InterfaceError.Unimplemented("Oracc.org isn't serving JSON right now.")
    }
    
    public init() {
        print("Warning: Oracc does not serve JSON for most of its projects. This is implemented for future support only.")
    }
}
