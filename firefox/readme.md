## Shitshow of an [app](firefox.com)

So some things I did to make it bearable with sidebery are listed below.

- `ui.key.menuAccessKeyFocuses` : `false`
- `ui.key.menuAccessKey`: `17`
- `full-screen-api.ignore-widgets` : `true`
- `toolkit.legacyUserProfileCustomizations.stylesheets`: `true`
- Run script below to hide tabs. Should add a folder called chrome to firefox directory, which has a single css change that hides the tabs. Path might be wrong, please check, that it works properbly. Solved by using this godsent of a [link](https://github.com/mbnuqw/sidebery/wiki/Firefox-Styles-Snippets-\(via-userChrome.css\)#completely-hide-tabs-strip)
    - `setup_firefox_custom_css.sh`


