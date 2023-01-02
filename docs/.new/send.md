# :Send(url)

{% hint style="warning" %}
HTTPService is required to send webhook messages.
{% endhint %}

Will send the message to a discord webhook (CONVERTS TO [PROXY](https://hooks.hyra.io))

```lua
local Disblox = require(path.to.disblox)
local message = Disblox.new()

message:Send("https://discord.com/api/webhooks/id/token")
--will automatically convert to hooks.hyra.io or any other proxy you set it to.
```
