return {

  -- The directory containing "VGMPlay.ini"
  inidir = "/home/bt1cn/devel/vgmplay/VGMPlay/",

  -- If true, attempt to use vgmplay in inidir
  -- Else assume it's available in PATH
  -- TODO: Where is inifile in system case?
  vgmplay_local = true,

  -- The directory to place the recordings in
  datadir = "/dev/shm/vgmsplit/test/",

  -- Which chips & channels thereof should be rendered
  -- Chip & channel names as given in default VGMPlay.ini
  --
  -- Set chip to true to solo all possible channels automatically
  -- Set chip to a table of channel names as strings to solo only the specified channels
  -- Connect 2 or more channel names in one string with a "+" to solo them together
  solos = {
    --[[
    YM2612 = {
      "Ch0",
      "Ch1",
      "Ch2",
      "Ch3",
      "Ch4",
      "Ch5+DAC",
    },
    SN76496 = true,
    --]]
    YMF262 = true,
  },

}
