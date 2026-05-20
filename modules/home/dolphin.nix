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
    Color=112,111,110
    ColorAmount=0.025
    ColorEffect=2
    ContrastAmount=0.1
    ContrastEffect=2
    Enable=false
    IntensityAmount=0
    IntensityEffect=0

    [Colors:Button]
    BackgroundAlternate=69,71,90
    BackgroundNormal=49,50,68
    DecorationFocus=180,190,254
    DecorationHover=180,190,254
    ForegroundActive=180,190,254
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:Complementary]
    BackgroundAlternate=24,24,37
    BackgroundNormal=30,30,46
    DecorationFocus=180,190,254
    DecorationHover=180,190,254
    ForegroundActive=180,190,254
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:Header]
    BackgroundAlternate=24,24,37
    BackgroundNormal=30,30,46
    DecorationFocus=180,190,254
    DecorationHover=180,190,254
    ForegroundActive=180,190,254
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:Header][Inactive]
    BackgroundAlternate=30,30,46
    BackgroundNormal=24,24,37
    DecorationFocus=180,190,254
    DecorationHover=180,190,254
    ForegroundActive=180,190,254
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:Selection]
    BackgroundAlternate=69,71,90
    BackgroundNormal=137,180,250
    DecorationFocus=180,190,254
    DecorationHover=180,190,254
    ForegroundActive=30,30,46
    ForegroundInactive=49,50,68
    ForegroundLink=249,226,175
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=30,30,46
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:Tooltip]
    BackgroundAlternate=24,24,37
    BackgroundNormal=49,50,68
    DecorationFocus=180,190,254
    DecorationHover=180,190,254
    ForegroundActive=180,190,254
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:View]
    BackgroundAlternate=24,24,37
    BackgroundNormal=30,30,46
    DecorationFocus=180,190,254
    DecorationHover=180,190,254
    ForegroundActive=180,190,254
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:Window]
    BackgroundAlternate=24,24,37
    BackgroundNormal=30,30,46
    DecorationFocus=180,190,254
    DecorationHover=180,190,254
    ForegroundActive=180,190,254
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [General]
    ColorScheme=CatppuccinMocha
    Name=Catppuccin Mocha
    shadeSortColumn=true

    [KDE]
    contrast=4

    [WM]
    activeBackground=30,30,46
    activeBlend=205,214,244
    activeForeground=205,214,244
    inactiveBackground=24,24,37
    inactiveBlend=166,173,200
    inactiveForeground=166,173,200
  '';
}
