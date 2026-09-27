local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('pvp_hud_system:getSettings', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.fetchAll('SELECT * FROM pvp_hud_settings WHERE player_id = @player_id', {['@player_id'] = playerId}, function(result)
        if result[1] then
            cb(result[1])
        else
            MySQL.Async.execute('INSERT INTO pvp_hud_settings (player_id, hud_position_x, hud_position_y, hud_size_width, hud_size_height, hud_color_r, hud_color_g, hud_color_b, hud_color_a) VALUES (@player_id, @hud_position_x, @hud_position_y, @hud_size_width, @hud_size_height, @hud_color_r, @hud_color_g, @hud_color_b, @hud_color_a)', {
                ['@player_id'] = playerId,
                ['@hud_position_x'] = Config.HudPosition.x,
                ['@hud_position_y'] = Config.HudPosition.y,
                ['@hud_size_width'] = Config.HudSize.width,
                ['@hud_size_height'] = Config.HudSize.height,
                ['@hud_color_r'] = Config.HudColor.r,
                ['@hud_color_g'] = Config.HudColor.g,
                ['@hud_color_b'] = Config.HudColor.b,
                ['@hud_color_a'] = Config.HudColor.a
            }, function(rowsChanged)
                cb(Config)
            end)
        end
    end)
end)