# Fivem OLD Read Memory Script

---

### Note

![Banner](https://cdn.sacul.cloud/v2/vision-cdn/atm/mainpage2.png)

[ZeroTrust](https://zerotrust.tebex.io/package/6603820) is a powerful FiveM anticheat designed to ensure fair play with extremely advanced features like Anti-Spoof and Anti-Stop. It combines intelligent detection systems to block cheats, prevent exploits, and keep your server secure while providing a seamless gaming experience.

<p align='center'>
  ZeroTrust offers the best <b>anticheat and threats detection</b>, visit <a href="https://zerotrust-ac.net">https://zerotrust-ac.net</a>.
</p>

---

## Infos

Since FiveM decided to [block certain natives](https://github.com/citizenfx/fivem/blob/b3ef62afa7e70d9139b54590ee2cbaef34ab71a4/code/components/rage-scripting-five/src/scrEngine.cpp#L34), here is how some anticheats instantly detected cheats like TZ. 

Some GTA 5 natives have full access to memory, such as `DataarrayGetString`, which takes a memory address as a parameter and attempts to read an integer from a given address. In my script, the `CheckMemory` function uses `DataarrayGetString` to read data from a provided memory address. If the read is successful, it returns a string representing the location of the data found at the memory address, such as "Fd3d10.dll"; otherwise, it returns "NoData".

For loops and calculations are used to break down a number into its hexadecimal components, creating addresses where a specific component or file we aim to detect, is located (which has surely been changed).

This detection has never been perfect because the location of memory addresses can vary depending on the operating system.
If two programs or libraries conflict over a particular memory space, the operating system may reallocate the addresses of one or the other.

⚠ [ZeroTrust Anticheat](https://zerotrust-ac.net) does not include this kind of practice, as it goes against FiveM's rules. ⚠