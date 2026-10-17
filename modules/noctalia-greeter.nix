{ ... }:
let
  # Whole folder copied to the store (world-readable, unlike anything
  # under /home/sven which is chmod 0700). noctalia-greeter only shows
  # one static image (no slideshow like noctalia-shell), so just change
  # the filename below to pick another one from this same folder.
  wallpapers = ./home/wallpapers;
in
{
  services.displayManager.noctalia-greeter.settings = {
    appearance = {
      scheme = "Synced";
      password_style = "default";
      hide_logo = false;
      power_buttons_position = "bottom-right";
      scheme_selector_position = "top-right";
      theme_mode = "dark";
      corner_radius_scale = 1.0;
      # font_family = "Inter";

      palette = {
        primary = "#E4C680";
        on_primary = "#1d2021";
        secondary = "#d79921";
        on_secondary = "#1d2021";
        tertiary = "#689d6a";
        on_tertiary = "#1d2021";
        error = "#cc241d";
        on_error = "#1d2021";
        surface = "#282828";
        on_surface = "#ebdbb2";
        surface_variant = "#3c3836";
        on_surface_variant = "#bdae93";
        outline = "#504945";
        shadow = "#1d2021";
        hover = "#fabd2f";
        on_hover = "#1d2021";
      };
    };

    appearance.wallpaper = {
      path = "${wallpapers}/yosemite.png";
      fill_mode = "crop";
    };
  };
}
