ROUND_WAITING = 0
ROUND_PREPARING = 1
ROUND_FREEZE = 2
ROUND_ACTIVE = 3
ROUND_ENDING = 4

local round_strs = {
	[ROUND_WAITING] = "Waiting...",
	[ROUND_PREPARING] = "Preparing...",
	[ROUND_FREEZE] = "Freeze",
	[ROUND_ACTIVE] = "Active",
	[ROUND_ENDING] = "Ending"
}

local function GetStrRoundState()
	local state = GetRoundState()
	return round_strs[state]
end

gsc.CreateCommand("round_state", "Allow to finish a round", function(team) 
	if team > 1 then
		SetRound(ROUND_ENDING, team)
	else
		SetRound(ROUND_ENDING)
	end
end, 'Round State', {"Draw", "Red", "Blue"}, false, GetStrRoundState)