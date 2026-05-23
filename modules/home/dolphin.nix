{ ... }:
{
  xdg.configFile."kdeglobals".text = ''
    [ColorEffects:Disabled]
    Color=56,56,56
    ColorAmount=0
    ColorEffect=0
    ContrastAmount=0.65
    ContrastEffect=1
    IntensityAmount=0.1
    IntensityEffect=2

    [ColorEffects:Inactive]
    ChangeSelectionColor=true
    Color=80,73,69
    ColorAmount=0.025
    ColorEffect=2
    ContrastAmount=0.1
    ContrastEffect=2
    Enable=false
    IntensityAmount=0
    IntensityEffect=0

    [Colors:Button]
    BackgroundAlternate=80,73,69
    BackgroundNormal=60,56,54
    DecorationFocus=228,198,128
    DecorationHover=196,168,94
    ForegroundActive=228,198,128
    ForegroundInactive=189,174,147
    ForegroundLink=69,133,136
    ForegroundNegative=140,74,74
    ForegroundNeutral=212,169,106
    ForegroundNormal=242,240,236
    ForegroundPositive=90,122,92
    ForegroundVisited=177,98,134

    [Colors:Complementary]
    BackgroundAlternate=60,56,54
    BackgroundNormal=40,40,40
    DecorationFocus=228,198,128
    DecorationHover=196,168,94
    ForegroundActive=228,198,128
    ForegroundInactive=189,174,147
    ForegroundLink=69,133,136
    ForegroundNegative=140,74,74
    ForegroundNeutral=212,169,106
    ForegroundNormal=242,240,236
    ForegroundPositive=90,122,92
    ForegroundVisited=177,98,134

    [Colors:Header]
    BackgroundAlternate=29,32,33
    BackgroundNormal=40,40,40
    DecorationFocus=228,198,128
    DecorationHover=196,168,94
    ForegroundActive=228,198,128
    ForegroundInactive=189,174,147
    ForegroundLink=69,133,136
    ForegroundNegative=140,74,74
    ForegroundNeutral=212,169,106
    ForegroundNormal=242,240,236
    ForegroundPositive=90,122,92
    ForegroundVisited=177,98,134

    [Colors:Header][Inactive]
    BackgroundAlternate=40,40,40
    BackgroundNormal=29,32,33
    DecorationFocus=228,198,128
    DecorationHover=196,168,94
    ForegroundActive=228,198,128
    ForegroundInactive=189,174,147
    ForegroundLink=69,133,136
    ForegroundNegative=140,74,74
    ForegroundNeutral=212,169,106
    ForegroundNormal=242,240,236
    ForegroundPositive=90,122,92
    ForegroundVisited=177,98,134

    [Colors:Selection]
    BackgroundAlternate=196,168,94
    BackgroundNormal=228,198,128
    DecorationFocus=228,198,128
    DecorationHover=196,168,94
    ForegroundActive=29,32,33
    ForegroundInactive=60,56,54
    ForegroundLink=29,32,33
    ForegroundNegative=140,74,74
    ForegroundNeutral=212,169,106
    ForegroundNormal=29,32,33
    ForegroundPositive=90,122,92
    ForegroundVisited=177,98,134

    [Colors:Tooltip]
    BackgroundAlternate=29,32,33
    BackgroundNormal=60,56,54
    DecorationFocus=228,198,128
    DecorationHover=196,168,94
    ForegroundActive=228,198,128
    ForegroundInactive=189,174,147
    ForegroundLink=69,133,136
    ForegroundNegative=140,74,74
    ForegroundNeutral=212,169,106
    ForegroundNormal=242,240,236
    ForegroundPositive=90,122,92
    ForegroundVisited=177,98,134

    [Colors:View]
    BackgroundAlternate=29,32,33
    BackgroundNormal=40,40,40
    DecorationFocus=228,198,128
    DecorationHover=196,168,94
    ForegroundActive=228,198,128
    ForegroundInactive=189,174,147
    ForegroundLink=69,133,136
    ForegroundNegative=140,74,74
    ForegroundNeutral=212,169,106
    ForegroundNormal=242,240,236
    ForegroundPositive=90,122,92
    ForegroundVisited=177,98,134

    [Colors:Window]
    BackgroundAlternate=29,32,33
    BackgroundNormal=40,40,40
    DecorationFocus=228,198,128
    DecorationHover=196,168,94
    ForegroundActive=228,198,128
    ForegroundInactive=189,174,147
    ForegroundLink=69,133,136
    ForegroundNegative=140,74,74
    ForegroundNeutral=212,169,106
    ForegroundNormal=242,240,236
    ForegroundPositive=90,122,92
    ForegroundVisited=177,98,134

    [General]
    ColorScheme=GruvboxDark
    Name=Gruvbox Dark
    shadeSortColumn=true

    [KDE]
    contrast=4

    [WM]
    activeBackground=40,40,40
    activeBlend=228,198,128
    activeForeground=228,198,128
    inactiveBackground=29,32,33
    inactiveBlend=189,174,147
    inactiveForeground=189,174,147
  '';
}
