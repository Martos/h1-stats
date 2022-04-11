local ui = require("utils/ui")

local playerStats = {0, 0, 0, 0, 0}
local statsVersion = 72

local language = 3 --| game:getdvarint("loc_language")

local out = io.open("stats.bin", "rb")

if out == nil then
    LUI.FlowManager.RequestAddMenu( self, "welcomeDialog" )
    local out = io.open("stats.bin", "w")
        
    out:write("")
    out:seek("set", 20)
    out:write("0")
    out:seek("set", 30)
    out:write("0")
    out:seek("set", 40)
    out:write("0")
    out:seek("set", 50)
    out:write("0")
    out:seek("set", 60)
    out:write("0")
    out:seek("set", 100)
    out:write(statsVersion)

    out:close()
end
if out ~= nil then
    local playerName = out:read(16)
    out:seek("set", 20)
    playerStats[1] = out:read("*n")
    out:seek("set", 30)
    playerStats[2] = out:read("*n")
    out:seek("set", 40)
    playerStats[3] = out:read("*n")
    out:seek("set", 50)
    playerStats[4] = out:read("*n")
    out:seek("set", 60)
    playerStats[5] = out:read("*n")
    out:seek("set", 100)
    statsVersion = out:read("*n")
    out:close()
end

LUI.addmenubutton("main_campaign", {
    index = 5,
    text = "@XBOXLIVE_VIEW_PROFILE",
    description = statsEntryDescription[language],
    callback = function() LUI.FlowManager.RequestAddMenu(nil, "stats_menu") end
})

LUI.MenuBuilder.m_types_build["stats_menu"] = function(a1)
	local menu = LUI.MenuTemplate.new(a1, {
		menu_title = "@XBOXLIVE_VIEW_PROFILE",
		exclusiveController = 0,
		menu_width = 400,
		menu_top_indent = LUI.MenuTemplate.spMenuOffset,
		showTopRightSmallBar = true
	})

    menu:addElement(presentBox())

    menu:AddBackButton(function(a1)
		Engine.PlaySound(CoD.SFX.MenuBack)
		LUI.FlowManager.RequestLeaveMenu(a1)
	end)

    return menu
end

LUI.MenuBuilder.registerPopupType( "welcomeDialog", welcome_stats_popup )
