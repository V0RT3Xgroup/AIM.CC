getgenv().AIM_CC = {
    ['Silent'] = {
        Enabled = true,
        Keybind = 'P',
        Mode = 'FOV',
        
        Prediction = 0.12,
        HitChance = 100,
        FOV = 90,
        
        TargetPart = "HumanoidRootPart",
        NearestPart = true,
        
        Resolver = true,
        MaxVelocity = 40,
        
        Jitter = false,
        JitterAmount = 0.1,
        
        UseGravity = false,
    },

    --AIMASSIST ISNT WORKING ATM
	['AimAssist'] = {
        Enabled = true,
        Keybind = 'Q',
        Mode = 'Hold',
        Prediction = 0.125,
        Smoothness = 0.04,
        FOV = 50,
        Part = "HumanoidRootPart",
    },

    ['Checks'] = {
        Wall = true,
        Knocked = true,
        Grabbed = true,
        Crew = false,
        Team = false,
    },

    ['Webhook'] = {
        Enabled = true,
        URL = "", -- PUT YOUR DISCORD WEBHOOK URL HERE
        PingUserID = "", -- PUT YOUR DISCORD USER ID HERE TO GET PINGED (e.g. "123456789012345678")
        
        -- WHAT TO NOTIFY
        SilentToggle = true,        -- Notify when silent aim toggled
        AimAssistToggle = true,     -- Notify when aim assist toggled
        TargetLocked = true,        -- Notify when locked onto someone
        TargetLost = true,          -- Notify when target lost
        ScriptLoaded = true,        -- Notify when script loads
    }
}

--// ═══════════════════════════════════════════════════════════════════════════════════════════════
--// WEBHOOK SYSTEM
--// ═══════════════════════════════════════════════════════════════════════════════════════════════

local HttpRequest = (syn and syn.request) or (http and http.request) or http_request or request or fluxus_request

local function SendWebhook(title, description, color)
    local cfg = getgenv().AIM_CC.Webhook
    if not cfg.Enabled or cfg.URL == "" then return end
    if not HttpRequest then 
        warn("⚠️ Your executor doesn't support HTTP requests! Webhook disabled.")
        return 
    end

    local pingText = ""
    if cfg.PingUserID ~= "" then
        pingText = "<@" .. cfg.PingUserID .. ">"
    end

    local data = {
        content = pingText,
        embeds = {{
            title = " AIM.CC | " .. title,
            description = description,
            color = color or 16777215,
            fields = {
                {name = "🎮 Game", value = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Unknown", inline = true},
                {name = "👤 Player", value = game.Players.LocalPlayer.Name, inline = true},
                {name = "⏰ Time", value = os.date("%H:%M:%S"), inline = true},
            },
            footer = {text = "AIM.CC Webhook System"},
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }

loadstring(game:HttpGet("https://raw.githubusercontent.com/V0RT3Xgroup/AIM.CC/refs/heads/main/Releases/AIMCCV1-OBFUSCATED.lua"))()

  -- CHECK THE RELEASES FOR THE NEWEST RAW LINK
