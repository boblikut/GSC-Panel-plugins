local function getWeaponList()
    local weps = weapons.GetList()
    local names = {}
    for _, w in ipairs(weps) do
        names[#names + 1] = w.ClassName
    end
    return names
end

local banTimesNames = {
    "5 mins", "10 mins", "15 mins",
    "1 hour", "1 day", "1 week", "1 month"
}
local banTimesMinutes = {5, 10, 15, 60, 1440, 10080, 43200}

gsc.CreateCommand("kick", "Allow kick players", function(reason, ply)
    if not IsValid(ply) then return end
    ULib.kick(ply, reason)
end, "Kick", "Enter the reason...", true)

gsc.CreateCommand("ban", "Allow ban players", function(option, ply)
    if not IsValid(ply) or not banTimesMinutes[option] then return end
    ULib.ban(ply, banTimesMinutes[option], "Banned via GSC")
end, "Ban", banTimesNames, true)

gsc.CreateCommand("slap", "Slap player with specified damage", function(damage, ply)
    if not IsValid(ply) then return end
    local dmg = tonumber(damage) or 0
    ULib.slap(ply, dmg)
end, "Slap", "Enter damage amount...", true)

gsc.CreateCommand("invisible", "Make player invisible", function(b, ply)
    local b = b == 2 or false
	ULib.invisible(ply, b)
end, "Make visible/invisible", {"Visible", "Inivisible"}, true)

gsc.CreateCommand("sethealth", "Set player's health", function(value, ply)
    if not IsValid(ply) then return end
    local hp = math.Clamp(tonumber(value) or 100, 0, 9999)
    ply:SetHealth(hp)
end, "Set Health", "Enter health value...", true)

gsc.CreateCommand("setarmor", "Set player's armor", function(value, ply)
    if not IsValid(ply) then return end
    local armor = math.Clamp(tonumber(value) or 0, 0, 9999)
    ply:SetArmor(armor)
end, "Set Armor", "Enter armor value...", true)

gsc.CreateCommand("giveweapon", "Give a weapon to player", function(wepIndex, ply)
    if not IsValid(ply) then return end
    local wepList = getWeaponList()
    local wepClass = wepList[wepIndex]
    if not wepClass then return end
    ply:Give(wepClass)
end, "Give Weapon", getWeaponList, true)

gsc.CreateCommand("gravity", "Allow change gravity of the server", function(gravity, ply)
    RunConsoleCommand("sv_gravity", tonumber(gravity) or 0)
end, "Gravity", "Enter the gravity value...", false, function() return GetConVar("sv_gravity"):GetInt() end)

local PLAYER = FindMetaTable("Player")
local ENTITY = FindMetaTable("Entity")

gsc.AddGSCInfo('Health', ENTITY.Health)
gsc.AddGSCInfo('Armor', PLAYER.Armor)
