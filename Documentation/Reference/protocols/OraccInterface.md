**PROTOCOL**

# `OraccInterface`

```swift
public protocol OraccInterface
```

> Protocol adopted by framework interface objects. Exposes a public API for selecting Oracc catalogues, querying the texts within, and getting output from them.

## Properties
### `decoder`

```swift
var decoder: JSONDecoder
```

### `oraccProjects`

```swift
var oraccProjects: [CDKOraccProject]
```

### `availableProjects`

```swift
var availableProjects: [CDKOraccProject]
```

## Methods
### `getOraccProjects()`

```swift
func getOraccProjects() throws -> [CDKOraccProject]
```

### `getAvailableProjects(_:)`

```swift
func getAvailableProjects(_ completion: @escaping ([CDKOraccProject])  -> Void) throws
```

### `loadCatalogue(_:)`

```swift
func loadCatalogue(_ volume: CDKOraccProject) throws -> OraccCatalog
```

### `loadText(_:inCatalogue:)`

```swift
func loadText(_ key: String, inCatalogue catalogue: OraccCatalog) throws -> OraccTextEdition
```

### `loadText(_:)`

```swift
func loadText(_ textEntry: OraccCatalogEntry) throws -> OraccTextEdition
```

### `loadGlossary(_:inCatalogue:)`

```swift
func loadGlossary(_ glossary: OraccGlossaryType, inCatalogue catalogue: OraccCatalog) throws -> OraccGlossary
```

### `loadGlossary(_:catalogueEntry:)`

```swift
func loadGlossary(_ glossary: OraccGlossaryType, catalogueEntry: OraccCatalogEntry) throws -> OraccGlossary
```
