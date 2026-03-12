EXT_KB = false
EXT_MOUSE = false

for _, device in pairs(hs.usb.attachedDevices()) do
    if device.productName == "Razer Huntsman Tournament Edition" then
        EXT_KB = true
    elseif device.productName == "Razer Naga Trinity" then
        EXT_MOUSE = true
    end
end
--
--- 5 is left thing, 6 is right thing, 9 onwards are mbs.
--

hs.hotkey.bindSpec(
    {nil, "u"},
    function()
        hs.eventtap.keyStroke({}, "F6", 0)
        hs.eventtap.keyStroke({}, "F8", 0)
    end
)

hs.hotkey.bindSpec(
    {nil, "`"},
    function()
        hs.eventtap.keyStroke({}, "end", 0)
    end
)

mouse_macro = hs.eventtap.new({hs.eventtap.event.types.otherMouseDown}, function(event)

    button = event:getProperty(hs.eventtap.event.properties.mouseEventButtonNumber)

    if (button == 9) then 
        hs.eventtap.keyStroke({}, ".", 0)
        hs.eventtap.keyStroke({}, ";", 0)
    end

end)

mouse_macro:start()

