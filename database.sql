CREATE TABLE IF NOT EXISTS pvp_hud_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    hud_position_x FLOAT NOT NULL,
    hud_position_y FLOAT NOT NULL,
    hud_size_width FLOAT NOT NULL,
    hud_size_height FLOAT NOT NULL,
    hud_color_r INT NOT NULL,
    hud_color_g INT NOT NULL,
    hud_color_b INT NOT NULL,
    hud_color_a INT NOT NULL,
    UNIQUE KEY unique_player (player_id)
);

INSERT INTO pvp_hud_settings (player_id, hud_position_x, hud_position_y, hud_size_width, hud_size_height, hud_color_r, hud_color_g, hud_color_b, hud_color_a) VALUES
(1, 0.85, 0.85, 0.15, 0.04, 255, 0, 0, 200);