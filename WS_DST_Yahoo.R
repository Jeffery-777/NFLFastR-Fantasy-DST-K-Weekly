
# Standard Yahoo DST

dst.df <- dst %>% 
  mutate(pts.allowed = case_when(
    points.allowed.corrected == 0 ~ 10,
    points.allowed.corrected > 0 & points.allowed.corrected <= 6 ~ 7,
    points.allowed.corrected >= 7 & points.allowed.corrected <= 13 ~ 4,
    points.allowed.corrected >= 14 & points.allowed.corrected <= 20 ~ 1,
    points.allowed.corrected >= 21 & points.allowed.corrected <= 27 ~ 0,
    points.allowed.corrected >= 28 & points.allowed.corrected <= 34 ~ -1,
    points.allowed.corrected >= 35 ~ -4
  )) %>% 
  # Create combined points
  mutate(yahoo =
           pts.allowed +
           (sacks * 1) +
           (ints * 2) +
           (fumble.recoveries * 2) +
           (kickoff.return.tds * 6) +
           (punt.return.tds * 6) +
           (def.tds * 6) +
           (safeties * 2) +
           (blocks * 2)) %>% 
  select(player_name, game_id, season, week, yahoo)
  