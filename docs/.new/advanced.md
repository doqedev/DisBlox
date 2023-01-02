---
description: This is how to import embeds in an advanced way.
---

# Advanced

```lua
local Disblox = require(path.to.disblox) 
local message = Disblox.new()
```

## Embeds

You can import embeds on your own using JSON without any wrapper.

```lua
-- // This code will import a new embed into the final table
table.insert(message.__embeds, {
	title = "Advanced Embed Test",
	description = "Hello, World!",
	color = 5793266,
})
```
