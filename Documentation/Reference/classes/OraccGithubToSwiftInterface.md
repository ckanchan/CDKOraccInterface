**CLASS**

# `OraccGithubToSwiftInterface`

```swift
public class OraccGithubToSwiftInterface: OraccInterface
```

> Class that connects to Github and manages the downloading and decoding of texts from archives hosted there.
> - important: This is the only functional way of getting Oracc open data at the moment.

## Properties
### `decoder`

```swift
public let decoder = JSONDecoder()
```

### `resourceURL`

```swift
private(set) public var resourceURL: URL
```

### `oraccProjects`

```swift
lazy public var oraccProjects: [CDKOraccProject] =
```

> Array of all projects hosted on Oracc. Returns an empty array if it can't reach the website.

### `availableProjects`

```swift
public lazy var availableProjects: [CDKOraccProject] =
```

## Methods
### `getAvailableProjects(_:)`

```swift
public func getAvailableProjects(_ completion: @escaping ([CDKOraccProject])  -> Void) throws
```

> Returns a list of all the volume available for download from Github.
>
>  - Parameter completion: completion handler which is passed the `OraccProjectEntry` array if and when loaded.

### `loadCatalogue(_:)`

```swift
public func loadCatalogue(_ volume: CDKOraccProject) throws -> OraccCatalog
```

> Returns a decoded `OraccCatalog` object, from the local file if present, otherwise downloads the archive from Github, extracts the catalogue, and decodes and returns.
> This method requires network access and should be called on a background thread.
>
> - Parameter volume: An `OraccProjectEntry` from `availableVolumes` representing the desired volume.

#### Parameters

| Name | Description |
| ---- | ----------- |
| volume | An `OraccProjectEntry` from `availableVolumes` representing the desired volume. |

### `loadText(_:inCatalogue:)`

```swift
public func loadText(_ key: String, inCatalogue catalogue: OraccCatalog) throws -> OraccTextEdition
```

> Loads the specified text ID from a given catalogue.
> - Parameter key: CDLI Text id of the text to be loaded
> - Parameter inCatalogue: Catalogue containing the text to be loaded.
> - Throws: Throws `InterfaceError.JSONError` if text cannot be decoded, `.TextError.notAvailable` if text cannot be found, `.ArchiveError` if retrieving the text directly from the Zip archive fails.

#### Parameters

| Name | Description |
| ---- | ----------- |
| key | CDLI Text id of the text to be loaded |
| inCatalogue | Catalogue containing the text to be loaded. |

### `loadGlossary(_:inCatalogue:)`

```swift
public func loadGlossary(_ glossary: OraccGlossaryType, inCatalogue catalogue: OraccCatalog) throws -> OraccGlossary
```

> Loads a glossary from a downloaded catalogue
> - Parameter glossary: takes a case of `OraccGlossaryType` describing the language or the subject of the glossary
> - Parameter inCatalogue: takes an `OraccCatalog`. Required because each Oracc project supplies its own glossary.
> - Returns: `OraccGlossary`
> - Throws: `InterfaceError.archiveError.errorReadingArchive` if the data cannot be read; further information is available in the associated value `.swiftError`

#### Parameters

| Name | Description |
| ---- | ----------- |
| glossary | takes a case of `OraccGlossaryType` describing the language or the subject of the glossary |
| inCatalogue | takes an `OraccCatalog`. Required because each Oracc project supplies its own glossary. |

### `loadGlossary(_:catalogueEntry:)`

```swift
public func loadGlossary(_ glossary: OraccGlossaryType, catalogueEntry: OraccCatalogEntry) throws -> OraccGlossary
```

### `loadText(_:)`

```swift
public func loadText(_ textEntry: OraccCatalogEntry) throws -> OraccTextEdition
```

### `setResourceURL(to:)`

```swift
public func setResourceURL(to url: URL) throws
```

> Changes the directory where archives are downloaded to another one specified by the user, if required. The default value is the user's temporary directory.
>  - Parameter url: A URL object representing the desired resource path
>  - Throws: `InterfaceError.cannotSetResourceURL`

### `clearCaches()`

```swift
public func clearCaches() throws
```

> Clears downloaded volumes from disk.

### `init()`

```swift
public init() throws
```
