export type authorEmbed = {
	Name: string,
	Url: string?,
	Icon: string?,
}

export type footerEmbed = {
	Text: string,
	Icon: string?,
	Time: string?,
}

export type embed = {
	Title: string,
	Description: string?,
	Color: Color3 | BrickColor | number | nil,
	Footer: footerEmbed?,
	Author: authorEmbed?,
}

local Disblox = {}
Disblox.Proxy = "hooks.hyra.io"
Disblox.__index = Disblox

Disblox.Content = ""
Disblox.Profile = {
	Name = "",
	Avatar = "",
}
Disblox.__embeds = {} -- just incase you want to do this in an advanced way.

function parseURL(url: string, self)
	url = url:gsub("ptb.", ""):gsub("canary.", "")
	return url:gsub("discord.com", self.Proxy):gsub("discordapp.com", self.Proxy)
end

function parseColor(clr: Color3)
	return math.floor(clr.R * 255) * 256 ^ 2 + math.floor(clr.G * 255) * 256 + math.floor(clr.B * 255)
end

function Disblox.new()
	local self = setmetatable({}, Disblox)
	self.embed = nil -- remove this lol
	return self
end

function Disblox.embed(): embed
	local self = {
		Title = "",
		Description = "",
		Color = Color3.fromHex("#2f3136"),
		Footer = {
			Text = "",
			Icon = "",
			Time = "",
		},
		Author = {
			Name = "",
			Url = "",
			Icon = "",
		},
	}

	return self
end

function Disblox:AddEmbed(embed: embed)
	if typeof(embed.Color) == "BrickColor" then
		embed.Color = embed.Color.Color
	elseif typeof(embed.Color) == "number" then
		embed.Color = tonumber(embed.Color)
	elseif typeof(embed.Color) == "Color3" then
	else
		error("Invalid color type.", 3)
	end

	local data = {
		["title"] = embed.Title,
		["description"] = embed.Description,
		["color"] = parseColor(embed.Color) or 3092790,
		["footer"] = {
			["text"] = embed.Footer.Text,
			["icon_url"] = embed.Footer.Icon,
			["timestamp"] = embed.Footer.Time,
		},
		["author"] = {
			name = embed.Author.Name,
			url = embed.Author.Url,
			icon_url = embed.Author.Icon,
		},
	}

	if data.title == "" then
		data.title = nil
	end
	if data.description == "" then
		data.description = nil
	end
	if data.color == 3092790 then
		data.color = nil
	end
	if data.footer.timestamp == "" then
		data.footer.timestamp = nil
	end
	if data.footer.icon_url == "" then
		data.footer.icon_url = nil
	end
	if data.footer.text == "" then
		data.footer = nil
	end

	if data.author.name == "" then
		data.author.name = nil
	end
	if data.author.url == "" then
		data.author.url = nil
	end
	if data.author.icon_url == "" then
		data.author.icon_url = nil
	end

	assert(data.title or data.author.name, "")
	table.insert(self.__embeds, data)
end

function BuildEmbed(self)
	local data = {
		["content"] = self.Content,
		["username"] = self.Profile.name,
		["avatar_url"] = self.Profile.avatar,
		["embeds"] = self.__embeds,
	}

	if data.content == "" then
		data.content = nil
	end
	if data.username == "" then
		data.username = nil
	end
	if data.avatar_url == "" then
		data.avatar_url = nil
	end

	return game:GetService("HttpService"):JSONEncode(data)
end

function Disblox:Send(url: string)
	assert(url, "URL either missing or nil")
	if url == "https://discord.com/api/webhooks/id/token" then
		return warn("DisBlox || Template link.")
	end
	url = parseURL(url, self)
	game:GetService("HttpService"):PostAsync(url, BuildEmbed(self))
end

return Disblox
