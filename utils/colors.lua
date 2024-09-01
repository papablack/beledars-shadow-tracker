local addonName, addonTable = ...
addonTable.colors = {}

local colors = addonTable.colors

local function _color_string(colorHex, text)
    return format("\124cff%s%s\124r", colorHex, text)
end

function colors.green(text)
    return _color_string("00ff00", text)
end

function colors.yellow(text)
    return _color_string("ffff00", text)
end

function colors.red(text)
    return _color_string("ff0000", text)
end

function colors.blue(text)
    return _color_string("0000ff", text)
end

function colors.violet(text)
    return _color_string("a060ff", text)
end

function colors.printColored(colorHex, txt)
    print(_color_string(colorHex, txt))
end;    
