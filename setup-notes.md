## Raspberry Pi 4B Pin Connections:

### UART USB

black -> GND
white -> GPIO 14 (TX UART)
green -> GPIO 15 (RX UART)
red -> DO NOT CONNECT!

## Reed Switch

GND -> Reed Switch wire 1
3.3v -> 10kΩ resistor -> GPIO 18 (pin 12)
GPIO 18 (pin 12) -> Reed Switch wire 2

3.3V
 |
[10k]
 |
 +------ GPIO18
 |
(Reed Switch)
 |
GND