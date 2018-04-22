**EXTENSION**

# `OraccInterface`

## Methods
### `getOraccProjects()`

```swift
public func getOraccProjects() throws -> [CDKOraccProject]
```

> Fetches and decodes an array of all projects hosted on Oracc.
> - Returns: An array of `OraccProjectEntry` where each entry represents an Oracc project.
> - Throws: `InterfaceError.cannotSetResourceURL` if it cannot find any data at the Oracc server.
> - Throws: `InterfaceError.JSONError.unableToDecode` if the remote JSON cannot be parsed.
