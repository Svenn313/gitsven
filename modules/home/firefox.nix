{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        proton-pass
        proton-vpn
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
