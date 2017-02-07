# Dotfiles
*Note*: I am using a shared home partition on my laptop dual-booting OSX and Archlinux. Because of that some parts of the configs are made specifically for handling problems occurring in this setup. For example, Vim YoucompleteMe plugin is compiled and cannot be easily shared with different os. Another problem is shared .emacs.d folder.

## Archlinux
  * `Emacs` - install `ttf-symbola` and `adobe-source-code-pro-fonts` fonts.


## OSX
  * To customize the HOME variable in Emacs.app add the following to `/Applications/Emacs.app/Contents/Info.plist`:
  ```
  <key>LSEnvironment</key>
  <dict>
      <key>HOME</key>
      <string>/Users/monstar/.config/osx-spacemacs-home</string>
  </dict>
  ```
  Then run the command to reload the app info:
  ```
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -v -f /Applications/Emacs.app
  ```
