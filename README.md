# PingStorm – Internet Service Latency Checker

PingStorm is a Bash-based CLI tool that simulates a speed test by pinging multiple online services (Google, Facebook, TikTok, etc.), analyzing response times, visualizing results, and managing logs and processes with a menu interface.

---

## Project Concept
This tool helps users understand network latency using real `ping` data. It works with arrays, parsing, process control, logging, and terminal UI.

---

## Features

### 1. Target Service List
- Predefined domains: `google.com`, `facebook.com`, `tiktok.com`, `youtube.com`, `netflix.com`

### 2. Ping Execution
- Sends 3 pings per service
- Extracts average latency (or marks as unreachable)

### 3. Result Analysis
- Logs and saves latency per service
- (Optional: further analysis can sort and identify best/worst)

### 4. Terminal Visualization
- Neatly formatted output per service
- "Returning to menu..." message improves user flow

### 5. Export to CSV (optional)
- Can store results in `ping_results.txt` for further use

### 6. Logging System
- Central file: `pingstorm.log`
- Timestamp, module, and action/result format

### 7. Control System
- `pingstorm_control.sh` to start/stop/status
- `pingstorm_menu.sh` for interactive CLI

### 8. README File
- You're reading it!

---

## How to Use

### 1. Make scripts executable
```bash
chmod +x *.sh
```

### 2. Run the menu
```bash
./pingstorm_menu.sh
```

### 3. Follow the menu
```
==== PingStorm Menu ====
1) Start Monitoring
2) Stop Monitoring
3) Status
4) Show Logs
5) Quit
```

---

## Sample Output
```
Pinging google.com...
google.com responded in 8 ms
...
~~~ End of ping test ~~~
Returning to menu...
```
 `pingstorm.log` entries:
```
[2025-03-26 20:50:17] [PING] google.com responded in 8 ms
[2025-03-26 20:50:49] [PING] netflix.com unreachable
```

---

## Team Contributions

| Name   | Contribution |
|--------|--------------|
| **Jen** | Tasks 1-2-3, GitHub repo creation |
| **Yoel** | Tasks 1-2-3|
| **Noya** | Tasks 3-4-5 (with Nadia) |
| **Nadia** | Tasks 3-4-5, Final integration, Menu UI, Logs |
| **Vadim** | Task 1-2-6-7 (Control system) |

---

## Files Structure

| File | Purpose |
|------|---------|
| `pingstorm.sh` | Main pinging logic |
| `pingstorm_menu.sh` | User interface menu |
| `pingstorm_control.sh` | Control system: start/stop/status |
| `logger.sh` | Logging system |
| `pingstorm.log` | Output log file |
| `ping_results.txt` | Result summary (optional export) |
| `README.md` | Project overview |

---

## Final Notes
All scripts are modular, readable, and follow the Bash scripting principles. The project is tested in Git Bash and Linux VM environments.

---

**Team PingStorm – 2025**


---

## GitHub Collaboration & Learning

Throughout this project, our team collaborated using **GitHub**, where we worked across multiple branches (`jen`, `noya`, `yoel`, `nadias_branch`, etc.).

While we encountered a few challenges with:
- Merge conflicts
- Git submodules
- Branch synchronization

These issues turned out to be valuable learning experiences. We learned how to:
- Use `git fetch`, `merge`, `pull`, and `push`
- Resolve merge conflicts
- Organize branches in a team setting
- Manage versions and use tags (`v1.0`)

This experience deepened our understanding of **Git**, GitHub workflows, and real-world collaboration in software development.

---
