GM.Name = "Propkill Training"
GM.Author = "Almighty Laxz and Iced Coffee"
GM.Email = "N/A"
GM.Website = "N/A"

DeriveGamemode("sandbox")

TEAM_DEATHMATCH = team.SetUp(1, "Student", Color(50, 255, 20, 255))
TEAM_RED = team.SetUp(2, "Teacher", Color(255, 50, 20, 255))
TEAM_UNASSIGNED = team.SetUp(4, "Unassigned", Color(70, 70, 70, 255))

util.PrecacheModel("models/player/alyx.mdl")