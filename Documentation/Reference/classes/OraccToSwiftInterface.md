**CLASS**

# `OraccToSwiftInterface`

```swift
public class OraccToSwiftInterface: OraccInterface
```

> This is a useless class right now.

## Properties
### `decoder`

```swift
public let decoder = JSONDecoder()
```

### `oraccProjects`

```swift
lazy public var oraccProjects: [CDKOraccProject] =
```

### `availableProjects`

```swift
lazy public var availableProjects: [CDKOraccProject] =
```

## Methods
### `loadCatalogue(_:)`

```swift
public func loadCatalogue(_ volume: CDKOraccProject) throws -> OraccCatalog
```

### `loadGlossary(_:inCatalogue:)`

```swift
public func loadGlossary(_ glossary: OraccGlossaryType, inCatalogue catalogue: OraccCatalog) throws -> OraccGlossary
```

### `loadGlossary(_:catalogueEntry:)`

```swift
public func loadGlossary(_ glossary: OraccGlossaryType, catalogueEntry: OraccCatalogEntry) throws -> OraccGlossary
```

### `getAvailableProjects(_:)`

```swift
public func getAvailableProjects(_ completion: @escaping ([CDKOraccProject]) -> Void) throws
```

### `loadText(_:inCatalogue:)`

```swift
public func loadText(_ key: String, inCatalogue catalogue: OraccCatalog) throws -> OraccTextEdition
```

### `loadText(_:)`

```swift
public func loadText(_ textEntry: OraccCatalogEntry) throws -> OraccTextEdition
```

### `init()`

```swift
public init()
```
