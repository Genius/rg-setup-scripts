prefix = `brew --prefix`.chomp
var = "#{prefix}/var"
domain = "homebrew.mxcl.postgresql"
File.open("#{`brew --cellar postgresql`.chomp}/9.1.9/#{domain}.plist", "w") do |file|
  file.write %Q{
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>KeepAlive</key>
  <true/>
  <key>Label</key>
  <string>#{domain}</string>
  <key>ProgramArguments</key>
  <array>
    <string>#{prefix}/bin/postgres</string>
    <string>-D</string>
    <string>#{var}/postgres</string>
    <string>-r</string>
    <string>#{var}/postgres/server.log</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
  <key>UserName</key>
  <string>#{`whoami`.chomp}</string>
  <key>WorkingDirectory</key>
  <string>#{prefix}</string>
  <key>StandardErrorPath</key>
  <string>#{var}/postgres/server.log</string>
</dict>
</plist>
  }.strip
end
