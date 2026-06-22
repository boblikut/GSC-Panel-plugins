gsc.CreateCommand("addpoints", "Add regular points", function(val, ply)
    local amt = math.max(0, tonumber(val) or 0)
    ply:PS2_AddStandardPoints(amt)
end, "Add Points", "Enter amount...", true)

gsc.CreateCommand("takepoints", "Take regular points", function(val, ply)
    local amt = math.max(0, tonumber(val) or 0)
    ply.PS2_Wallet.points = math.max(0, ply.PS2_Wallet.points - amt)
    ply.PS2_Wallet:save()
end, "Take Points", "Enter amount...", true)

gsc.CreateCommand("addpremium", "Add premium points", function(val, ply)
    local amt = math.max(0, tonumber(val) or 0)
    ply:PS2_AddPremiumPoints(amt)
end, "Add Premium Points", "Enter amount...", true)

gsc.CreateCommand("takepremium", "Take premium points", function(val, ply)
    local amt = math.max(0, tonumber(val) or 0)
    ply.PS2_Wallet.premiumPoints = math.max(0, ply.PS2_Wallet.premiumPoints - amt)
    ply.PS2_Wallet:save()
end, "Take Premium Points", "Enter amount...", true)

gsc.AddGSCInfo("Points", function(ply)
    return ply.PS2_Wallet.points or 0
end)

gsc.AddGSCInfo("Premium Points", function(ply)
    return ply.PS2_Wallet.premiumPoints or 0
end)