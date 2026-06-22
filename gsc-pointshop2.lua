local PLAYER = FindMetaTable("Player")

gsc.CreateCommand("setpoints", "Set player's regular points", function(value, ply)
    if not IsValid(ply) then return end
    local points = math.Clamp(tonumber(value) or 0, 0, 999999)
    ply:PS2_SetPoints(points)
end, "Set Points", "Enter points amount...", true)

gsc.CreateCommand("addpoints", "Add regular points to player", function(value, ply)
    if not IsValid(ply) then return end
    local points = tonumber(value) or 0
    ply:PS2_GivePoints(points)
end, "Add Points", "Enter amount to add...", true)

gsc.CreateCommand("takepoints", "Take regular points from player", function(value, ply)
    if not IsValid(ply) then return end
    local points = tonumber(value) or 0
    ply:PS2_TakePoints(points)
end, "Take Points", "Enter amount to take...", true)

gsc.CreateCommand("setpremium", "Set player's premium points", function(value, ply)
    if not IsValid(ply) then return end
    local points = math.Clamp(tonumber(value) or 0, 0, 999999)
    ply:PS2_SetPremiumPoints(points)
end, "Set Premium Points", "Enter premium points amount...", true)

gsc.CreateCommand("addpremium", "Add premium points to player", function(value, ply)
    if not IsValid(ply) then return end
    local points = tonumber(value) or 0
    ply:PS2_GivePremiumPoints(points)
end, "Add Premium Points", "Enter amount to add...", true)

gsc.CreateCommand("takepremium", "Take premium points from player", function(value, ply)
    if not IsValid(ply) then return end
    local points = tonumber(value) or 0
    ply:PS2_TakePremiumPoints(points)
end, "Take Premium Points", "Enter amount to take...", true)

gsc.AddGSCInfo("Points", function(ply)
    if not IsValid(ply) then return 0 end
    return ply:PS2_GetPoints()
end)

gsc.AddGSCInfo("Premium Points", function(ply)
    if not IsValid(ply) then return 0 end
    return ply:PS2_GetPremiumPoints()
end)