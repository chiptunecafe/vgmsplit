local function genCh (max, extras, ChPrefix)
  local gen = {}
  for i = 0, max do
    gen[i] = (ChPrefix or "Ch") .. i
  end
  for k,v in ipairs (extras or {}) do
    gen[#gen + 1] = v
  end
  return gen
end

local percs   = { "BD", "SD", "TOM", "TC", "HH" }
local percsDt = { "BD", "SD", "TOM", "TC", "HH", "DT" }

return {
  SN76496     = genCh (3),
  YM2413      = genCh (8, percs),
  YM2612      = genCh (5, { "DAC" }),
  YM2151      = genCh (7),
  SegaPCM     = genCh (15),
  RF5C68      = genCh (7),
  YM2203      = genCh (2),
  YM2608      = genCh (5, genCh (5, { "DT" }, "PCMCh"), "FMCh"),
  YM2610      = genCh (5, genCh (5, { "DT" }, "PCMCh"), "FMCh"),
  YM3812      = genCh (8, percs),
  YM3526      = genCh (8, percs),
  Y8950       = genCh (8, percsDt),
  YMF262      = genCh (17, percs),
  YMF278B     = genCh (23, genCh (17, percs, "FMCh"), "WTCh"),
  YMF271      = genCh (11),
  YMZ280B     = genCh (7),
  RF5C164     = genCh (7),
  PWM         = {},
  AY8910      = genCh (2),
  GameBoy     = genCh (3),
  ["NES APU"] = genCh (5),
  YMW258      = genCh (27),
  uPD7759     = {},
  OKIM6258    = {},
  OKIM6295    = genCh (3),
  K051649     = genCh (4),
  K054539     = genCh (7),
  HuC6280     = genCh (5),
  C140        = genCh (23),
  K053260     = genCh (3),
  Pokey       = genCh (3),
  QSound      = genCh (15),
  SCSP        = genCh (31),
  WSwan       = genCh (3),
  VSU         = genCh (5),
  SAA1099     = genCh (5),
  ES5503      = genCh (31),
  ES5506      = genCh (31),
  ["X1-010"]  = genCh (15),
  C352        = genCh (31),
  GA20        = genCh (3),
}
