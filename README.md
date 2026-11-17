# Lab 1: FSD, but on Kigali roads

**Course:** Introduction to Python Programming and Databases (BSE Year 1, Trimester 2)
**Author:** Isimbi Bajeneza Sonia

## What this project does

A Full Self Driving (FSD) car drives from **ALU Rwanda** to the **Convention Center** in Kigali. The road is a Python list, and each item is one 100 m segment. The car reads each sign and reacts:

| Sign | What the car does |
|------|-------------------|
| `"60"`, `"80"` (20 to 100) | Changes the speed limit |
| `"zebra"` | Stops, then continues |
| `"bus"` | Moves to the left lane |
| `"road"` | Nothing happens |

A web page shows the car driving, and every run is written to `transit_session.log`.

## Files

- `road_simulation.py`: my work. It contains the 10 functions.
- `transit_program.py`, `engine.py`, `index.html`: given files, not edited.
- `analyze_log.sh`: Bash script that reads the log and prints a summary.
- `README.md`: this file.

## The 10 functions in `road_simulation.py`

1. `is_valid_sign`: accepts only `bus`, `zebra`, or a number from 20 to 100 written as text.
2. `get_sign_type`: returns `bus`, `zebra`, `speed` or `road`.
3. `get_speed_limit`: returns the new limit for a speed sign, otherwise keeps the current one.
4. `get_target_speed`: returns 0 while stopped at a zebra, otherwise the limit.
5. `adjust_speed`: speeds up by 5 or brakes by 20, never passing the target.
6. `count_signs`: uses a loop to count speed signs, zebras and buses.
7. `ask_for_number`: keeps asking until the user types a whole number in range (uses `try/except`).
8. `insert_sign`: inserts a sign with bounds checking.
9. `replace_sign`: replaces a sign with bounds checking.
10. `get_journey_summary`: counts signs passed, works out the road length, and returns the start and end names.

## How to run

1. Open a terminal in this folder.
2. Run `python road_simulation.py`.
3. Enter a driver name and use the road editor menu.
4. Choose **5. Start driving** and open the link shown (for example `http://127.0.0.1:8008`).
5. Go back to the terminal and press **Enter**. The car starts to drive.

## Log analyser (shell script)

After running the simulation at least once, run:

```
bash analyze_log.sh
```

Or give it another log file:

```
bash analyze_log.sh other_log.log
```

It prints the number of sessions, zebra stops and lane changes, plus the driver name and top speed of the latest trip. If the file does not exist, it prints an error and exits with code 1.

## Input validation and edge cases

- Signs must be `bus`, `zebra`, or a number from 20 to 100. Anything else is rejected.
- The menu keeps asking until the user types a valid whole number. Text does not crash the program.
- `insert_sign` and `replace_sign` return `False` for positions that do not exist.