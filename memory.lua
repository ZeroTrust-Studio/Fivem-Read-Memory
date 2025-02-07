local DataarrayGetInt <const> = DataarrayGetInt

---@param memoryAdress number
---@return string
local function CheckMemory(memoryAdress)
    local result, err = xpcall(
        function()
            return DataarrayGetInt(memoryAdress, 2147483647)
        end,
        function(err)
            return false
        end
    )
    return result
end

---@return boolean
local function CheckTZInMemory()
    local hex_chars = '0123456789abcdef'
    for a = 6, 7 do
        for val = 1, (15 * 16^3) do
            local b = math.floor((val - 1) / (16^3)) + 1
            local r = (val - 1) % (16^3)
            local c = math.floor(r / (16^2))
            local r2 = r % (16^2)
            local d = math.floor(r2 / 16)
            local e = r2 % 16
            local HEX_ADDRESS <const> = "0x7ff"
                .. hex_chars:sub(a + 1, a + 1)
                .. hex_chars:sub(b + 1, b + 1)
                .. hex_chars:sub(c + 1, c + 1)
                .. hex_chars:sub(d + 1, d + 1)
                .. hex_chars:sub(e + 1, e + 1)
                .. "e480"
            local MEM <const> = CheckMemory(tonumber(HEX_ADDRESS))
            if MEM then
                print("Detected TZ", MEM)
            end
            Wait(5)
        end
    end
end