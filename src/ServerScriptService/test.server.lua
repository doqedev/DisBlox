local DisBlox = require(game:GetService("ServerStorage").DisBlox.MainModule)
DisBlox.Proxy = "rezokar.xyz"

local msg = DisBlox.new()
local embed = DisBlox.embed()

embed.Title = "Bemis"
embed.Color = BrickColor.new("Bright red")
embed.Description = "Hello World!"

msg:AddEmbed(embed)
msg:Send("https://discord.com/api/webhooks/id/token")
