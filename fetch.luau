local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer

local function getPlatform()
	local uis = game:GetService("UserInputService")
	local p = uis:GetPlatform()
	if p == Enum.Platform.Windows then return "Windows" end
	if p == Enum.Platform.OSX then return "macOS" end
	if p == Enum.Platform.IOS then return "iOS" end
	if p == Enum.Platform.Android then return "Android" end
	if p == Enum.Platform.XBox360 or p == Enum.Platform.XBoxOne then return "Xbox" end
	return "Unknown"
end

local function fastfetch()
	local fps = math.floor(60 / RunService.Heartbeat:Wait())
	local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue() or 0)
	local mem = math.floor(game:GetService("Stats").GetTotalMemoryUsageMb(game:GetService("Stats")))

	print("\n")
	print("[38;5;81m   ██████╗  █████╗ ███████╗████████╗███████╗███████╗████████╗ ██████╗██╗  ██╗[0m")
	print("[38;5;81m   fastfetch - Roblox Client[0m")
	print("[38;5;81m───────────────────────────────────────────────[0m\n")

	print("[38;5;117m  [0m[1mClient[0m")
	print("   [38;5;250mOS[0m          " .. getPlatform())
	print("   [38;5;250mUsername[0m    " .. LocalPlayer.Name)
	print("   [38;5;250mUserID[0m      " .. LocalPlayer.UserId)
	print("   [38;5;250mAccountAge[0m  " .. LocalPlayer.AccountAge .. " days\n")

	print("[38;5;117m  [0m[1mGame[0m")
	print("   [38;5;250mName[0m        " .. game.Name)
	print("   [38;5;250mPlaceID[0m     " .. game.PlaceId)
	print("   [38;5;250mJobID[0m       " .. game.JobId)
	print("   [38;5;250mCreator[0m     " .. game.CreatorType.Name .. "\n")

	print("[38;5;117m  [0m[1mNetwork[0m")
	print("   [38;5;250mPing[0m        " .. ping .. " ms")
	print("   [38;5;250mFPS[0m         " .. fps)
	print("   [38;5;250mMemory[0m      " .. mem .. " MB\n")

	print("[38;5;117m  [0m[1mRoblox[0m")
	print("   [38;5;250mVersion[0m     " .. version())
	print("   [38;5;250mClientID[0m    " .. game:GetService("RbxAnalyticsService"):GetClientId())
	print("\n[38;5;81m───────────────────────────────────────────────[0m")
end

task.wait(1)
fastfetch()
