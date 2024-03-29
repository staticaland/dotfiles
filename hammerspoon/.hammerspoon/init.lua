local window = require 'hs.window'

hyper = {"ctrl", "alt", "cmd", "shift"}

hs.hotkey.bind(hyper, "h", function()
    hs.application.get("Hammerspoon"):selectMenuItem("Console...")
    hs.application.launchOrFocus("Hammerspoon")
end)

local applicationHotkeys = {
    t = 'iTerm',
    c = 'Slack',
    o = 'Obsidian',
    e = 'Emacs',
    f = 'Firefox',
    s = 'Spotify'
}

for key, app in pairs(applicationHotkeys) do
    hs.hotkey.bind(hyper, key, function() hs.application.launchOrFocus(app) end)
end

hs.hotkey.bind(hyper, "W", function()
    window.focusedWindow():close()
    hs.window.frontmostWindow():focus()
end)

hs.hotkey.bind(hyper, 'I', function()
    hs.task.new("/usr/sbin/screencapture", nil, {"-ic"}):start()
end)

if hs.midi.devices()[3] then
    midiDevice = hs.midi.new(hs.midi.devices()[3])

    midiDevice:callback(function(object, deviceName, commandType, description,
                                 metadata)
        if commandType == "noteOn" then
            if metadata.note == 41 then
                hs.application.launchOrFocus("Slack")
            end
            if metadata.note == 43 then
                hs.application.launchOrFocus("Firefox")
            end
            if metadata.note == 45 then
                hs.application.launchOrFocus("Spotify")
            end
            if metadata.note == 47 then
                hs.application.launchOrFocus("iTerm")
            end
            if metadata.note == 48 then
                hs.application.launchOrFocus("Obsidian")
            end
        end
    end)
end

local function pasteOcrText()
    local image = hs.pasteboard.readImage()

    if image then
        local imagePath = "/tmp/ocr_image.png"
        image:saveToFile(imagePath)

        local _, success = hs.execute("/usr/local/bin/tesseract -l eng " ..
                                          imagePath .. " /tmp/ocr_output")

        if success then
            -- Read in OCR result
            local file = io.open("/tmp/ocr_output.txt", "r")
            local content = file:read("*all")
            file:close()

            -- Type out the OCR
            hs.eventtap.keyStrokes(content)

            -- clean up
            hs.execute("rm " .. imagePath .. " /tmp/ocr_output.txt")
        end
    end
end

hs.hotkey.bind(hyper, 'P', pasteOcrText())
