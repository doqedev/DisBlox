---
description: A builder for the webhook embed
---

# .embed()

```lua
local Disblox = require(path.to.disblox) --// Call the disblox path.
local message = Disblox.new()
local embed = Disblox.embed() --// or message.embed(), whatever you prefer.
```

{% hint style="warning" %}
A title or author is required for sending an embed. Otherwise the discord api and disblox will error.
{% endhint %}

### .Title (string | nil)

```lua
embed.Title = "A Sample Title."
```

### .Description (string? | nil)

```lua
embed.Description = "A sample description."
```

### .Color (Color3? | BrickColor? | number? | nil)

```lua
embed.Color = Color3.fromRGB(0,170,255)
---------------------------------------
embed.Color = BrickColor.new("Cyan")
---------------------------------------
embed.Color = 307180
```

