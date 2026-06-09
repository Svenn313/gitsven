{ config, pkgs, ... }:

{
  programs.firefox = {
    configPath = ".mozilla/firefox";
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        proton-pass
        (buildFirefoxXpiAddon {
          pname = "proton-vpn";
          version = "3.0";
          addonId = "{c228008e-9d02-4c6d-9b54-288507710fa1}";
          url = "https://addons.mozilla.org/firefox/downloads/file/2844710/proton_vpn-3.0.xpi";
          sha256 = "0dxfp30nnahc4j35p6fdv36bj85h4bdvh5gnxzs6kinryzqr45pb";
          meta = {};
        })
        (buildFirefoxXpiAddon {
          pname = "7tv";
          version = "3.1.16";
          addonId = "{ad154789-4a30-4559-9ac8-2e0efb6c4b0f}";
          url = "https://addons.mozilla.org/firefox/downloads/file/4672494/7tv_extension-3.1.16.xpi";
          sha256 = "sha256-uNpeVBwDyYLcy8wKtcI5geW8w9Qu9JzDPr1VIlkE1G8=";
          meta = {};
        })
      ];

      # -------------------------------------------------------------------------
      # Settings (about:config)
      # -------------------------------------------------------------------------
      settings = {
        # --- Sync ---
        "services.sync.engine.addons"                       = true;
        "services.sync.engine.bookmarks"                    = true;
        "services.sync.engine.passwords"                    = true;
        "services.sync.engine.prefs"                        = true;
        "services.sync.engine.tabs"                         = true;
        "identity.fxaccounts.enabled"                       = true;

        # --- UI / UX ---
        "browser.startup.homepage"                          = "about:home";
        "browser.newtabpage.enabled"                        = true;
        "browser.toolbars.bookmarks.visibility"             = "always";
        "browser.tabs.tabMinWidth"                          = 76;
        "browser.compactmode.show"                          = true;
        "browser.uidensity"                                 = 1;
        "ui.systemUsesDarkTheme"                            = 1;

        # --- Privacy ---
        "privacy.donottrackheader.enabled"                  = true;
        "privacy.trackingprotection.enabled"                = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "geo.enabled"                                       = false;
        "browser.safebrowsing.malware.enabled"              = true;
        "browser.safebrowsing.phishing.enabled"             = true;

        # --- Performances ---
        "gfx.webrender.all"                                 = true;
        "media.hardware-video-decoding.enabled"             = true;

        # --- Telemetry OFF ---
        "toolkit.telemetry.enabled"                         = false;
        "toolkit.telemetry.unified"                         = false;
        "datareporting.healthreport.uploadEnabled"          = false;
        "app.shield.optoutstudies.enabled"                  = false;

        # --- Misc ---
        "browser.download.useDownloadDir"                   = true;
        "browser.download.dir"                              = "/home/sven/downloads";
        "browser.ctrlTab.sortByRecentlyUsed"                = true;
        "browser.warnOnQuit"                                = true; 
      };
    }; 
  };
}
