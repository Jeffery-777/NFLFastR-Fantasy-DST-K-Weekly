kicking.yahoo <- kicking %>% 
  group_by(game_id, kicker_player_id, kicker_player_name, posteam, season, week) %>% 
  summarise(pts = 
            (sum(pats) * 1) +
            (sum(fg.30) * 3) +
            (sum(fg.40) * 4) +
            (sum(fg.50p) * 5)) %>% 
  mutate(pts = ifelse(is.na(pts), 0, pts))
