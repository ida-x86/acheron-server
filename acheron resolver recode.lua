--[[
    resolver for gamesense.pub
    made by haruki
    discord: wchar_t
]]

local ffi = require('ffi')
local http = require('gamesense/http')

local ent_c = {}
ent_c.get_client_entity = vtable_bind('client.dll', 'VClientEntityList003', 3, 'void*(__thiscall*)(void*, int)')

local animation_state_t =
	ffi.typeof('\13\10\9\115\116\114\117\99\116\32\123\13\10\9\9\99\104\97\114\9\117\48\91\32\48\120\49\56\32\93\59\13\10\9\9\102\108\111\97\116\9\97\110\105\109\95\117\112\100\97\116\101\95\116\105\109\101\114\59\13\10\9\9\99\104\97\114\9\117\49\91\32\48\120\67\32\93\59\13\10\9\9\102\108\111\97\116\9\115\116\97\114\116\101\100\95\109\111\118\105\110\103\95\116\105\109\101\59\13\10\9\9\102\108\111\97\116\9\108\97\115\116\95\109\111\118\101\95\116\105\109\101\59\13\10\9\9\99\104\97\114\9\117\50\91\32\48\120\49\48\32\93\59\13\10\9\9\102\108\111\97\116\9\108\97\115\116\95\108\98\121\95\116\105\109\101\59\13\10\9\9\99\104\97\114\9\117\51\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\114\117\110\95\97\109\111\117\110\116\59\13\10\9\9\99\104\97\114\9\117\52\91\32\48\120\49\48\32\93\59\13\10\9\9\118\111\105\100\9\42\101\110\116\105\116\121\59\13\10\9\9\95\95\105\110\116\51\50\32\97\99\116\105\118\101\95\119\101\97\112\111\110\59\13\10\9\9\95\95\105\110\116\51\50\32\108\97\115\116\95\97\99\116\105\118\101\95\119\101\97\112\111\110\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\76\97\115\116\67\108\105\101\110\116\83\105\100\101\65\110\105\109\97\116\105\111\110\85\112\100\97\116\101\84\105\109\101\59\13\10\9\9\95\95\105\110\116\51\50\32\109\95\105\76\97\115\116\67\108\105\101\110\116\83\105\100\101\65\110\105\109\97\116\105\111\110\85\112\100\97\116\101\70\114\97\109\101\99\111\117\110\116\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\65\110\105\109\85\112\100\97\116\101\68\101\108\116\97\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\69\121\101\89\97\119\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\80\105\116\99\104\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\71\111\97\108\70\101\101\116\89\97\119\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\67\117\114\114\101\110\116\70\101\101\116\89\97\119\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\67\117\114\114\101\110\116\84\111\114\115\111\89\97\119\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\85\110\107\110\111\119\110\86\101\108\111\99\105\116\121\76\101\97\110\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\76\101\97\110\65\109\111\117\110\116\59\13\10\9\9\99\104\97\114\9\117\53\91\32\48\120\52\32\93\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\70\101\101\116\67\121\99\108\101\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\70\101\101\116\89\97\119\82\97\116\101\59\13\10\9\9\99\104\97\114\9\117\54\91\32\48\120\52\32\93\59\13\10\9\9\102\108\111\97\116\9\109\95\102\68\117\99\107\65\109\111\117\110\116\59\13\10\9\9\102\108\111\97\116\9\109\95\102\76\97\110\100\105\110\103\68\117\99\107\65\100\100\105\116\105\118\101\83\111\109\101\116\104\105\110\103\59\13\10\9\9\99\104\97\114\9\117\55\91\32\48\120\52\32\93\59\13\10\9\9\102\108\111\97\116\32\9\109\95\118\79\114\105\103\105\110\88\59\32\47\47\48\120\66\48\13\10\9\9\102\108\111\97\116\32\9\109\95\118\79\114\105\103\105\110\89\59\32\47\47\48\120\66\52\13\10\9\9\102\108\111\97\116\32\9\109\95\118\79\114\105\103\105\110\90\59\32\47\47\48\120\66\56\13\10\9\9\102\108\111\97\116\32\9\109\95\118\76\97\115\116\79\114\105\103\105\110\88\59\32\47\47\48\120\66\67\13\10\9\9\102\108\111\97\116\32\9\109\95\118\76\97\115\116\79\114\105\103\105\110\89\59\32\47\47\48\120\67\48\13\10\9\9\102\108\111\97\116\32\9\109\95\118\76\97\115\116\79\114\105\103\105\110\90\59\32\47\47\48\120\67\52\13\10\9\9\102\108\111\97\116\9\109\95\118\86\101\108\111\99\105\116\121\88\59\13\10\9\9\102\108\111\97\116\9\109\95\118\86\101\108\111\99\105\116\121\89\59\13\10\9\9\99\104\97\114\9\117\56\91\32\48\120\49\48\32\93\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\85\110\107\110\111\119\110\70\108\111\97\116\49\59\32\47\47\109\111\118\101\95\100\105\114\101\99\116\105\111\110\95\49\13\10\9\9\102\108\111\97\116\9\109\95\102\108\85\110\107\110\111\119\110\70\108\111\97\116\50\59\32\47\47\109\111\118\101\95\100\105\114\101\99\116\105\111\110\95\50\13\10\9\9\99\104\97\114\9\117\57\91\32\48\120\52\32\93\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\83\112\101\101\100\50\68\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\85\112\86\101\108\111\99\105\116\121\59\32\13\10\9\9\102\108\111\97\116\9\109\95\102\108\83\112\101\101\100\78\111\114\109\97\108\105\122\101\100\59\32\13\10\9\9\102\108\111\97\116\9\109\95\102\108\70\101\101\116\83\112\101\101\100\70\111\114\119\97\114\100\115\79\114\83\105\100\101\87\97\121\115\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\70\101\101\116\83\112\101\101\100\85\110\107\110\111\119\110\70\111\114\119\97\114\100\79\114\83\105\100\101\119\97\121\115\59\32\13\10\9\9\102\108\111\97\116\9\109\95\102\108\84\105\109\101\83\105\110\99\101\83\116\97\114\116\101\100\77\111\118\105\110\103\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\84\105\109\101\83\105\110\99\101\83\116\111\112\112\101\100\77\111\118\105\110\103\59\13\10\9\9\98\111\111\108\9\109\95\98\79\110\71\114\111\117\110\100\59\13\10\9\9\98\111\111\108\9\109\95\98\73\110\72\105\116\71\114\111\117\110\100\65\110\105\109\97\116\105\111\110\59\13\10\9\9\99\104\97\114\9\117\49\48\91\32\48\120\52\32\93\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\76\97\115\116\79\114\105\103\105\110\90\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\72\101\97\100\72\101\105\103\104\116\79\114\79\102\102\115\101\116\70\114\111\109\72\105\116\116\105\110\103\71\114\111\117\110\100\65\110\105\109\97\116\105\111\110\59\13\10\9\9\102\108\111\97\116\9\109\95\102\108\83\116\111\112\84\111\70\117\108\108\82\117\110\110\105\110\103\70\114\97\99\116\105\111\110\59\13\10\9\9\99\104\97\114\9\117\49\49\91\32\48\120\49\52\32\93\59\13\10\9\9\95\95\105\110\116\51\50\32\109\95\102\108\85\110\107\110\111\119\110\70\114\97\99\116\105\111\110\59\13\10\9\9\99\104\97\114\9\117\49\50\91\32\48\120\50\48\32\93\59\13\10\9\9\102\108\111\97\116\9\108\97\115\116\95\97\110\105\109\95\117\112\100\97\116\101\95\116\105\109\101\59\13\10\9\9\102\108\111\97\116\9\109\111\118\105\110\103\95\100\105\114\101\99\116\105\111\110\95\120\59\13\10\9\9\102\108\111\97\116\9\109\111\118\105\110\103\95\100\105\114\101\99\116\105\111\110\95\121\59\13\10\9\9\102\108\111\97\116\9\109\111\118\105\110\103\95\100\105\114\101\99\116\105\111\110\95\122\59\13\10\9\9\99\104\97\114\9\117\49\51\91\32\48\120\52\52\32\93\59\13\10\9\9\95\95\105\110\116\51\50\32\115\116\97\114\116\101\100\95\109\111\118\105\110\103\59\13\10\9\9\99\104\97\114\9\117\49\52\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\108\101\97\110\95\121\97\119\59\13\10\9\9\99\104\97\114\9\117\49\53\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\112\111\115\101\115\95\115\112\101\101\100\59\13\10\9\9\99\104\97\114\9\117\49\54\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\108\97\100\100\101\114\95\115\112\101\101\100\59\13\10\9\9\99\104\97\114\9\117\49\55\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\108\97\100\100\101\114\95\121\97\119\59\13\10\9\9\99\104\97\114\9\117\49\56\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\115\111\109\101\95\112\111\115\101\59\13\10\9\9\99\104\97\114\9\117\49\57\91\32\48\120\49\52\32\93\59\13\10\9\9\102\108\111\97\116\9\98\111\100\121\95\121\97\119\59\13\10\9\9\99\104\97\114\9\117\50\48\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\98\111\100\121\95\112\105\116\99\104\59\13\10\9\9\99\104\97\114\9\117\50\49\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\100\101\97\116\104\95\121\97\119\59\13\10\9\9\99\104\97\114\9\117\50\50\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\115\116\97\110\100\59\13\10\9\9\99\104\97\114\9\117\50\51\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\106\117\109\112\95\102\97\108\108\59\13\10\9\9\99\104\97\114\9\117\50\52\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\97\105\109\95\98\108\101\110\100\95\115\116\97\110\100\95\105\100\108\101\59\13\10\9\9\99\104\97\114\9\117\50\53\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\97\105\109\95\98\108\101\110\100\95\99\114\111\117\99\104\95\105\100\108\101\59\13\10\9\9\99\104\97\114\9\117\50\54\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\115\116\114\97\102\101\95\121\97\119\59\13\10\9\9\99\104\97\114\9\117\50\55\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\97\105\109\95\98\108\101\110\100\95\115\116\97\110\100\95\119\97\108\107\59\13\10\9\9\99\104\97\114\9\117\50\56\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\97\105\109\95\98\108\101\110\100\95\115\116\97\110\100\95\114\117\110\59\13\10\9\9\99\104\97\114\9\117\50\57\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\97\105\109\95\98\108\101\110\100\95\99\114\111\117\99\104\95\119\97\108\107\59\13\10\9\9\99\104\97\114\9\117\51\48\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\109\111\118\101\95\98\108\101\110\100\95\119\97\108\107\59\13\10\9\9\99\104\97\114\9\117\51\49\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\109\111\118\101\95\98\108\101\110\100\95\114\117\110\59\13\10\9\9\99\104\97\114\9\117\51\50\91\32\48\120\56\32\93\59\13\10\9\9\102\108\111\97\116\9\109\111\118\101\95\98\108\101\110\100\95\99\114\111\117\99\104\59\13\10\9\9\99\104\97\114\9\117\51\51\91\32\48\120\52\32\93\59\13\10\9\9\102\108\111\97\116\9\115\112\101\101\100\59\13\10\9\9\95\95\105\110\116\51\50\32\109\111\118\105\110\103\95\105\110\95\97\110\121\95\100\105\114\101\99\116\105\111\110\59\13\10\9\9\102\108\111\97\116\9\97\99\99\101\108\101\114\97\116\105\111\110\59\13\10\9\9\99\104\97\114\9\117\51\52\91\32\48\120\55\52\32\93\59\13\10\9\9\102\108\111\97\116\9\99\114\111\117\99\104\95\104\101\105\103\104\116\59\13\10\9\9\95\95\105\110\116\51\50\32\105\115\95\102\117\108\108\95\99\114\111\117\99\104\101\100\59\13\10\9\9\99\104\97\114\9\117\51\53\91\32\48\120\52\32\93\59\13\10\9\9\102\108\111\97\116\9\118\101\108\111\99\105\116\121\95\115\117\98\116\114\97\99\116\95\120\59\13\10\9\9\102\108\111\97\116\9\118\101\108\111\99\105\116\121\95\115\117\98\116\114\97\99\116\95\121\59\13\10\9\9\102\108\111\97\116\9\118\101\108\111\99\105\116\121\95\115\117\98\116\114\97\99\116\95\122\59\13\10\9\9\102\108\111\97\116\9\115\116\97\110\100\105\110\103\95\104\101\97\100\95\104\101\105\103\104\116\59\13\10\9\125\32\42\42\13\10')

local animation_layer_t =
	ffi.typeof('\13\10\9\115\116\114\117\99\116\32\123\9\9\9\9\9\9\9\9\9\9\99\104\97\114\32\112\97\100\48\91\48\120\49\56\93\59\13\10\9\9\117\105\110\116\51\50\95\116\9\109\95\110\83\101\113\117\101\110\99\101\59\13\10\9\9\102\108\111\97\116\9\9\109\95\102\108\80\114\101\118\67\121\99\108\101\59\13\10\9\9\102\108\111\97\116\9\9\109\95\102\108\87\101\105\103\104\116\59\13\10\9\9\102\108\111\97\116\9\9\109\95\102\108\87\101\105\103\104\116\68\101\108\116\97\82\97\116\101\59\13\10\9\9\102\108\111\97\116\9\9\109\95\102\108\80\108\97\121\98\97\99\107\82\97\116\101\59\13\10\9\9\102\108\111\97\116\9\9\109\95\102\108\67\121\99\108\101\59\13\10\9\9\118\111\105\100\9\9\42\101\110\116\105\116\121\59\9\9\9\9\9\9\99\104\97\114\32\112\97\100\49\91\48\120\52\93\59\13\10\9\125\32\42\42\13\10')

local offsets = {
	animstate = 0x9960,
	animlayer = 0x2990
}

entity.get_animstate = function (ent)
	local ent_ptr = ffi.cast('void***', ent_c.get_client_entity(ent))
	local animstate_ptr = ffi.cast("char*", ent_ptr) + offsets.animstate
	local entity_animstate = ffi.cast(animation_state_t, animstate_ptr)[0]
	return entity_animstate
end

entity.get_animlayer = function (ent)
	local ent_ptr = ffi.cast('void***', ent_c.get_client_entity(ent or entity.get_local_player()))
	local animlayer_ptr = ffi.cast('char*', ent_ptr) + offsets.animlayer
	local entity_animlayer = ffi.cast(animation_layer_t, animlayer_ptr)[0]
	return entity_animlayer
end

-- get menu refs --
local menu_refs = {};
menu_refs["Enable"]              = ui.new_checkbox("Rage", "Other", "\afa5757FF [ acheron ]\aCFCFCFCF resolver");
menu_refs["ResetAll"]            = ui.reference("Players", "Players", "Reset All");
menu_refs["CorrectionActive"]    = ui.reference("Players", "Adjustments", "Correction Active");

function Enable_Update()
    if ui.get(menu_refs["Enable"]) then
        ui.set_visible(menu_refs["CorrectionActive"], false);
    else
        ui.set_visible(menu_refs["CorrectionActive"], true);
        ui.set(menu_refs["ResetAll"], true);
    end
end
Enable_Update();

-- util stuff --
local utils = {};

utils.clamp = function(value, min, max)
    if (value > max) then
        return max;
    elseif (value < min) then
        return min;
    end

    return value;
end

utils.approachAngle = function(target, value, speed)
    target = math.fmod(target, 360.0);
    value = math.fmod(value, 360.0);

    local delta = target - value;

    if (speed < 0) then
        speed = -speed;
    end

    if (delta < -180.0) then
        delta = delta + 360;
    elseif (delta > 180.0) then
        delta = delta - 360;
    end

    if (delta > speed) then
        value = value + speed;
    elseif (delta < -speed) then
        value = value - speed;
    else
        value = target;
    end

    return delta;
end

utils.angle_diff = function(dest, src)
    local delta = 0.0

    delta = math.fmod(dest - src, 360.0)

    if dest > src then
        if delta >= 180 then delta = delta - 360 end
    else
        if delta <= -180 then delta = delta + 360 end
    end

    return delta
end

utils.NormalizeAngle = function(x)
    x = math.fmod(x + 180, 360);

    if (x < 0) then
        x = x + 360;
    end

    return x - 180;
end

local function between( v, min, max )
	v = v or false
	min = min or false
	max = max or false

	return (v and min and max) and (v > min and v < max) or false
end

-- resolver stuff --
local resolver = {};
local Animlayers = {};
local AnimParts = {};
local AnimList = {"m_flPrevCycle", "m_flWeight", "m_flWeightDeltaRate", "m_flPlaybackRate", "m_flCycle"};
local TempPitch = {};
local resolve_mode = {};
local resolve_flags = {};
local miss_count = {};
local bruteforce_list = {30, -30, 60, -60, 0}
local angle_diff_last = {};
local angle_diff = {};

local MISS_COUNT_MAX = 5;

for i = 1, 64 do
    resolve_mode[i] = "None";
    resolve_flags[i] = "None";
    miss_count[i] = 1;
    TempPitch[i] = 0;
end

resolver.init = function(Player)
    for u = 1, 13, 1 do
        Animlayers[u] = {};
        Animlayers[u]["Main"]                   = entity.get_animlayer(Player);
        
        Animlayers[u]["m_flPrevCycle"]          = Animlayers[u]["Main"].m_flPrevCycle;
        Animlayers[u]["m_flWeight"]             = Animlayers[u]["Main"].m_flWeight;
        Animlayers[u]["m_flWeightDeltaRate"]    = Animlayers[u]["Main"].m_flWeightDeltaRate;
        Animlayers[u]["m_flPlaybackRate"]       = Animlayers[u]["Main"].m_flPlaybackRate;
        Animlayers[u]["m_flCycle"]              = Animlayers[u]["Main"].m_flCycle;
        
        AnimParts[u] = {};
        for y, val in pairs(AnimList) do
            AnimParts[u][val] = {};
            for i = 1, 13, 1 do
                 AnimParts[u][val][i] = math.floor(Animlayers[u][val]*(10^i)) - (math.floor(Animlayers[u][val]*(10^(i-1)))*10);
            end
        end
    end

    resolve_mode[Player] = "None";
    resolve_flags[Player] = "None";

    -- ensures it doesnt exceed our bruteforce_list size
    miss_count[Player] = utils.clamp(miss_count[Player], 1, MISS_COUNT_MAX);
end

-- flag -> string --
resolver.set_flag = function(Player, Flag)
    resolve_flags[Player] = Flag;
end

-- flag -> string --
resolver.add_flag = function(Player, Flag)
    if (resolve_flags[Player] == "None") then
        resolve_flags[Player] = Flag;
    else
        resolve_flags[Player] = resolve_flags[Player] .. " | " .. Flag;
    end
end

-- mode -> string --
resolver.set_mode = function (Player, Mode)
    resolve_mode[Player] = Mode;
end

-- corrects players pitch --
resolver.correct_pitch = function(Player)
    local PlayerPitch = ({entity.get_prop(Player, "m_angEyeAngles")})[1];

    if (PlayerPitch < 0 and TempPitch[Player] > 0) then
        plist.set(Player, "Force Pitch", true);
        plist.set(Player, "Force Pitch Value", TempPitch[Player]);
    else
        plist.set(Player, "Force Pitch", false);
        TempPitch[Player] = PlayerPitch;
    end

    if (plist.get(Player, "Force Pitch")) then
        resolver.add_flag(Player, "PITCH");
    end
end

resolver.resolve_move_yaw = function(Player, animstate)
    local eye_yaw = ({entity.get_prop(Player, "m_angEyeAngles")})[2];
    local foot_yaw = animstate.m_flGoalFeetYaw;
    local walk_to_run = animstate.m_flWalkToRunTransition;
    local last_upd_inc = animstate.m_flLastUpdateIncrement;

    return utils.approachAngle(eye_yaw, foot_yaw, (walk_to_run * 20.0 + 30.0) * last_upd_inc);
end

-- gets max desync delta --
resolver.get_desync_max_delta = function(Player)
    local animstate = entity.get_animstate(Player)

    local speedfactor = utils.clamp(animstate.m_flFeetSpeedForwardsOrSideWays, 0, 1)
    local avg_speedfactor = (animstate.m_flStopToFullRunningFraction * -0.3 - 0.2) * speedfactor + 1

    local duck_amount = animstate.m_fDuckAmount

    if duck_amount > 0 then
        local max_velocity = utils.clamp(animstate.m_flFeetSpeedForwardsOrSideWays, 0, 1)
        local duck_speed = duck_amount * max_velocity

        avg_speedfactor = avg_speedfactor + (duck_speed * (0.5 - avg_speedfactor))
    end

    return avg_speedfactor
end

-- gets the side of the desync relative to the players real
resolver.get_desync_side = function(Player)
    local animstate = entity.get_animstate(Player);
    local vx = entity.get_prop(Player, "m_vecVelocity[0]");
    local vy = entity.get_prop(Player, "m_vecVelocity[1]")
    local vz = entity.get_prop(Player, "m_vecVelocity[2]");
    local velocity_2d = math.sqrt((vx * vx) + (vy * vy))
    local side = 0

    if not (Animlayers[12]["Main"].m_flWeight * 1000.0) and velocity_2d > 0.1 and
        (Animlayers[12]["Main"].m_flWeight * 1000.0) == (Prev_Animlayers[6]["Main"].m_flWeight * 1000.0) then

        local m_layer_delta1 = math.abs(Animlayers[6]["Main"].m_flPlaybackRate - Prev_Animlayers[6]["Main"].m_flPlaybackRate)
        local m_layer_delta2 = math.abs(Animlayers[6]["Main"].m_flPlaybackRate - Prev_Animlayers[6]["Main"].m_flPlaybackRate)
        local m_layer_delta3 = math.abs(Animlayers[6]["Main"].m_flPlaybackRate - Prev_Animlayers[6]["Main"].m_flPlaybackRate)

        if m_layer_delta1 < m_layer_delta2 or m_layer_delta3 <= m_layer_delta2 or m_layer_delta2 * 1000.0 then
             if m_layer_delta1 >= m_layer_delta3 and m_layer_delta2 > m_layer_delta3 and not (m_layer_delta3 * 1000.0) then
                 side = 1
             end
        else
             side = -1
        end
    end

    if (side == 0) then
        local eye_yaw = ({entity.get_prop(Player, "m_angEyeAngles")})[2];
        --local m_flAngleDiff = utils.angle_diff(animstate.m_flEyeYaw, animstate.m_flGoalFeetYaw)
        local m_flAngleDiff = utils.angle_diff(eye_yaw, animstate.m_flGoalFeetYaw)

        if m_flAngleDiff < 0 then
            side = 1
        elseif m_flAngleDiff > 0 then
            side = -1
        end
    end

    return side
end

-- finds the delta of the players desync --
resolver.get_desync_delta = function(Player)
    local delta = 0;
    local animstate = entity.get_animstate(Player);

    -- get desync side --
    local side = resolver.get_desync_side(Player);

    -- get max delta --
    local max_delta = resolver.get_desync_max_delta(Player) * 58 + 1;

    -- other vars --
    local yaw = entity.get_prop(Player, "m_flPoseParameter", 11);
    local yawv2 = entity.get_prop(Player, "m_flPoseParameter", 11) * 120 - 60;

    local lby = entity.get_prop(Player, "m_flLowerBodyYawTarget");
    local eye_yaw = ({entity.get_prop(Player, "m_angEyeAngles")})[2];

    local fl_desync_delta = utils.angle_diff(eye_yaw, animstate.m_flGoalFeetYaw);
    fl_desync_delta = utils.clamp(fl_desync_delta, -max_delta, max_delta);

    local lby_delta = utils.angle_diff(eye_yaw, lby);

    -- note - haruki: idk wtf this logic does, but it gives a good estimate on their delta. --

    -- correct desync delta --
    local RSideR = AnimParts[6]["m_flPlaybackRate"][4] + AnimParts[6]["m_flPlaybackRate"][5] + AnimParts[6]["m_flPlaybackRate"][6] + AnimParts[6]["m_flPlaybackRate"][7];
    local RSideS = AnimParts[6]["m_flPlaybackRate"][6] + AnimParts[6]["m_flPlaybackRate"][7] + AnimParts[6]["m_flPlaybackRate"][8] + AnimParts[6]["m_flPlaybackRate"][9];

    local delta_fuckit = 0;

    if (AnimParts[6]["m_flPlaybackRate"][3] == 0) then
        local Tmp = -3.4117 * RSideS + 98.9393;
        if Tmp < 64 then
            delta = Tmp;
        end

        delta_fuckit = Tmp;
    else
        local Tmp = -3.4117 * RSideR + 98.9393;
        if Tmp < 64 then
            delta = Tmp;
        end

        delta_fuckit = Tmp;
    end

    -- delta_fuckit = utils.clamp(delta_fuckit, -1 * max_delta, max_delta);

    -- correct high delta --
    if (Animlayers[3]["Main"].m_flCycle == 0 and Animlayers[3]["Main"].m_flWeight == 0) then
        resolver.set_mode(Player, "HIGH DELTA");
        if (side ~= 0) then
            resolver.add_flag(Player, ("SIDE(" .. side .. ")"));
            return max_delta * side;
        else
            return max_delta;
        end
    end

    -- idk, from a skeet leak --
    if (animstate.m_flFeetYawRate ~= 0) then
        if ( animstate.m_flFeetYawRate == 60.0 or animstate.m_flFeetYawRate > 60.0 ) then
            resolver.set_mode(Player, "MAX DELTA (RIGHT)");
            return max_delta;

        elseif ( animstate.m_flFeetYawRate == -60.0 or animstate.m_flFeetYawRate < -60.0 ) then
            resolver.set_mode(Player, "MAX DELTA (LEFT)");
            return max_delta * -1;
        end
    end

    if (side ~= 0 and delta ~= 0) then
        resolver.set_mode(Player, "DELTA ESTIMATE");
        resolver.add_flag(Player, ("SIDE(" .. side .. ")"));
        return math.abs(delta) * side;

    elseif (delta ~= 0) then
        resolver.set_mode(Player, "DELTA ESTIMATE");
        return delta;

    elseif (math.abs(fl_desync_delta) < 35.0) then
        resolver.set_mode(Player, "LOW DELTA");


    end

    --local rebuilt_footyaw = resolver.resolve_move_yaw(Player, animstate);

    resolver.set_mode(Player, "TEST");
    --return rebuilt_footyaw;
    return max_delta * side;
end

resolver.run = function(Player)
    -- init --
    resolver.init(Player);

    -- get desync delta --
    local desync = resolver.get_desync_delta(Player);

    -- correct pitch --
    resolver.correct_pitch(Player);

    if (desync == 666) then
        plist.set(Player, "Correction active", true);
        plist.set(Player, "Force body yaw", false);
        plist.set(Player, "Force body yaw value", 0);
    end

    -- let skeet know that we have taken over --
    plist.set(Player, "Correction active", false);
    plist.set(Player, "Force body yaw", true);
    plist.set(Player, "Force body yaw value", desync);
end

-- main loop that runs the resolver --
function resolver_loop()
    if (not ui.get(menu_refs["Enable"])) then
        return;
    end

    local Players = entity.get_players(true);

    for i=1, #Players do
        local Player = Players[i];

        resolver.run(Player);
    end
end

-- callback for a resolver_loop --
client.set_event_callback("net_update_end", resolver_loop);

-- callback for misses --
client.set_event_callback("aim_miss", function(e)
    if (e.reason == "?" and ui.get(menu_refs["Enable"])) then
	    client.color_log(255, 0, 0, "[ acheron resolver ] \0")
	    client.color_log(255, 255, 255, string.format("mode: %s [ %s ]", resolve_mode[e.target], resolve_flags[e.target]))

        -- handle bruteforce
        miss_count[e.target] = miss_count[e.target] + 1; -- dont think lua has +=
    end
end)

-- callback for our flags --
client.register_esp_flag("", 255, 246, 210, function(arg)
    return true, resolve_mode[arg];
end)

-- callback for enable checkbox --
ui.set_callback(menu_refs["Enable"], function()
    Enable_Update();
end)

-- callback for when acheron is unloaded --
client.set_event_callback('shutdown', function()
    ui.set_visible(menu_refs["CorrectionActive"], true);
    ui.set(menu_refs["ResetAll"], true);
end)