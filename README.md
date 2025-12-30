# 🧱 Minecraft Server Tools (mc & mc-new)

Two simple Bash scripts for **setting up** and **managing** Minecraft servers on Linux.  
No panels. No Docker. No magic. Just clean, transparent server control.

---

## ✨ Features

### `mc` – Server Manager
- Start Minecraft servers inside **screen sessions**
- Graceful stop via `stop` command
- Attach / detach to server console
- List:
  - running servers
  - available server folders
- Works with **Vanilla, Paper, Purpur, Forge**

### `mc-new` – Server Setup Wizard
- Interactive setup wizard
- Supported software:
  - Vanilla
  - Paper
  - Purpur
  - Forge (official installer)
- Automatically creates:
  - `server.jar` (or symlink for Forge)
  - `eula.txt`
  - minimal `server.properties`
  - `run.sh`
- Optional immediate start after setup

---

## 📁 Recommended Directory Structure

```text
/home/minecraft/
├── survival_1.21.4/
│   ├── server.jar
│   ├── server.properties
│   ├── eula.txt
│   └── run.sh
├── modded_1.20.1/
│   ├── forge-*.jar
│   ├── server.jar -> forge-*.jar
│   └── run.sh
```

One server = one folder.  
Simple, predictable, clean.

---

## 🔧 Requirements

- Linux (tested on Debian / Ubuntu)
- Bash
- Java 17+ (depending on Minecraft version)
- `screen`
- For `mc-new` additionally:
  - `curl`
  - `jq`

Install dependencies (Debian/Ubuntu):

```bash
sudo apt install screen curl jq openjdk-21-jre-headless
```

---

## 🚀 Installation

1. Clone the repository:

```bash
git clone https://github.com/<your-user>/<repo>.git
cd <repo>
```

2. **Edit the base directory in both scripts**:

```bash
BASE_DIR="/home/minecraft"
```

3. Make scripts executable:

```bash
chmod +x mc mc-new
```

4. (Optional) Make them globally available:

```bash
sudo ln -s "$(pwd)/mc" /usr/local/bin/mc
sudo ln -s "$(pwd)/mc-new" /usr/local/bin/mc-new
```

---

## 🧪 Usage

### Create a new server

```bash
mc-new
```

The wizard will ask for:
- server name
- software (Vanilla / Paper / Purpur / Forge)
- Minecraft version
- for Forge: exact Forge version

---

### Start a server

```bash
mc start <servername>
```

### Stop a server

```bash
mc stop <servername>
```

### Attach to server console

```bash
mc attach <servername>
```

### List running servers

```bash
mc list
```

### List available server folders

```bash
mc servers
```

---

## 🔥 Forge Notes (Important)

- Forge **always requires an exact Forge version**
  - Example: `1.20.1-47.2.20`
- The script:
  - downloads the official Forge installer
  - runs `--installServer`
  - creates a `server.jar` symlink automatically
- **Some Forge versions generate their own `run.sh`**
  - In that case, the script tells you clearly
  - No silent failures

---

## ⚠️ What This Repo Is NOT

- ❌ No web panel
- ❌ No Docker setup
- ❌ No hosting service
- ❌ No “one-click everything”

**Goal:**  
Clean server management for people who want control and understand what’s running.

---

## 🛠️ Configuration

In the `mc` script:

```bash
MIN_MEM="8G"
MAX_MEM="12G"
JAVA="java"
JAR_NAME="server.jar"
```

Everything is intentionally simple.

---

## 🧠 Philosophy

- Clear instead of clever
- Bash instead of overengineering
- Control instead of black boxes
- Errors should be visible, not hidden

---

## 📄 License

MIT License  
Do whatever you want — but understand it first.

---

## 👤 Author

**Noel Janzen**  
30.12.2025
