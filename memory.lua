local DataarrayGetString <const> = DataarrayGetString

---@param memoryAdress number
---@return string
local function CheckMemory(memoryAdress)
    local result, err = xpcall(
        function()
            return DataarrayGetString(memoryAdress, 2147483647)
        end,
        function(err)
            return "NoData"
        end
    )
    return result
end

---@return boolean
local function CheckTZInMemory()
    local HEX_CHARS <const> = '0123456789abcdef'
    for a = 6, 7 do
        for val = 1, (15 * 16^3) do
            local b = math.floor((val - 1) / (16^3)) + 1
            local r = (val - 1) % (16^3)
            local c = math.floor(r / (16^2))
            local r2 = r % (16^2)
            local d = math.floor(r2 / 16)
            local e = r2 % 16
            local HEX_ADDRESS <const> = "0x7ff"
                .. HEX_CHARS:sub(a + 1, a + 1)
                .. HEX_CHARS:sub(b + 1, b + 1)
                .. HEX_CHARS:sub(c + 1, c + 1)
                .. HEX_CHARS:sub(d + 1, d + 1)
                .. HEX_CHARS:sub(e + 1, e + 1)
                .. "e480"
            local MEM <const> = CheckMemory(tonumber(HEX_ADDRESS))
            if string.find(MEM, "dll") then
                print("Detected TZ", MEM)
            end
        end
    end
end

CheckTZInMemory()