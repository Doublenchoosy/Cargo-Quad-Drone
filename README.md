# Printable frame parts

Three parts, sized to the exact components from the shopping list:

- **center_plate** — mounts the SpeedyBee F405 V4 stack (30.5mm hole pattern) and cradles the inboard end of each carbon tube arm.
- **motor_mount** — print 4 of these. Clamps to the outboard end of each tube and has the 19x19mm M3 bolt pattern for the iFlight 2812 motor, plus a center hole for the motor wires.
- **payload_deck** — carries the Raspberry Pi (standard 58x49mm hole pattern) on standoffs run down through the same 30.5mm pattern as the center plate, so one style of M3 standoff works the whole stack.

## Print settings
- Material: PETG (handles vibration and heat better than PLA — motors and ESCs get warm)
- Walls: 4 (center_plate, motor_mount — these carry flight loads), 3 is fine for payload_deck
- Infill: 25-30% gyroid or grid for center_plate/motor_mount, 15% for payload_deck
- Orientation: print flat as-is, no supports needed
- Consider M3 heat-set inserts for the stack and motor bolt holes if you'll be removing those screws often — not needed for the small zip-tie holes

## Tube arms
Get the **10x12x330mm** carbon tube (12mm OD), 4 pieces. Dry-fit the center plate and all 4 motor mounts on the tubes first, slide the motor mounts in/out until the motor-to-motor diagonal spacing is around 580-620mm, then mark, add a dab of thick CA glue or epoxy in each cradle groove, and zip-tie both ends of every tube through the small holes flanking the groove. Let the glue cure before your first flight. 330mm leaves about 70mm of slack per tube for this tuning step — no need for the longer 420mm version.

## Files
- `*.scad` — source, editable in the free OpenSCAD app if any of your actual parts differ slightly (open the file, change the variable at the top, e.g. `stack_span`, and re-render)
- `*.stl` — ready to slice and print as-is
