# 🧱 Minecraft Server Tools  
### `mc` & `mc-new`

> Lightweight Bash tools to **create, manage, and run Minecraft servers** on Linux —  
> without panels, containers, or hidden magic.

---

## 📌 Overview

This repository provides **two complementary CLI tools**:

- **`mc`** – a server manager that runs Minecraft servers inside `screen` sessions  
- **`mc-new`** – an interactive setup wizard for creating new server instances

Designed for users who want **full control**, **clarity**, and **zero abstraction**.

---

## ✨ Features

### 🛠️ `mc` – Server Manager

- Start servers inside dedicated **screen sessions**
- Graceful shutdown via in-game `stop`
- Attach/detach from the live console
- List:
  - running Minecraft servers
  - available server directories
- Works with:
  - Vanilla
  - Paper
  - Purpur
  - Forge

---

### 🧪 `mc-new` – Server Setup Wizard

- Fully interactive terminal wizard
- Supported server software:
  - Vanilla
  - Paper
  - Purpur
  - Forge (official installer)
- Automatically generates:
  - `server.jar` (or symlink for Forge)
  - `eula.txt`
  - minimal `server.properties`
  - `run.sh`
- Optional immediate server start after setup

---

## 📁 Recommended Directory Layout

```text
/home/minecraft/
├── survival_1.21.4/
│   ├── server.jar
│   ├── server.properties
│   ├── eula.txt
│   └── run.sh
├── modded_1.20.1/
│   ├── forge-1.20.1-47.2.20.jar
│   ├── server.jar -> forge-1.20.1-47.2.20.jar
│   └── run.sh
```

**Rule:** one server = one directory  
Predictable, debuggable, clean.

---

## 🔧 Requirements

- Linux (tested on Debian / Ubuntu)
- Bash
- Java **17+** (depending on Minecraft version)
- `screen`
- For `mc-new` additionally:
  - `curl`
  - `jq`

### Install dependencies (Debian / Ubuntu)

```bash
sudo apt update
sudo apt install screen curl jq openjdk-21-jre-headless
```

---

## 🚀 Installation

### 1️⃣ Clone the repository

```bash
git clone https://github.com/Gaminggul/Minecraft-Server-Managment-Scripts.git
cd minecraft-server-managment-scripts
```

### 2️⃣ Configure base directory

Edit **both scripts** and set your server root:

```bash
BASE_DIR="/home/minecraft"
```

### 3️⃣ Make scripts executable

```bash
chmod +x mc mc-new
```

### 4️⃣ (Optional) Install globally

```bash
sudo ln -s "$(pwd)/mc" /usr/local/bin/mc
sudo ln -s "$(pwd)/mc-new" /usr/local/bin/mc-new
```

---

## 🧪 Usage

### ➕ Create a new server

```bash
mc-new
```

You will be prompted for:
- server name
- software (Vanilla / Paper / Purpur / Forge)
- Minecraft version
- **Forge only:** exact Forge version (e.g. `1.20.1-47.2.20`)

---

### ▶️ Start a server

```bash
mc start <servername>
```

### ⏹ Stop a server

```bash
mc stop <servername>
```

### 🖥 Attach to console

```bash
mc attach <servername>
```

### 📋 List running servers

```bash
mc list
```

### 📂 List available servers

```bash
mc servers
```

---

## 🔥 Forge Notes (Important)

- Forge **always requires an exact version**
  - Example: `1.20.1-47.2.20`
- The setup script:
  - downloads the official Forge installer
  - runs `--installServer`
  - creates a `server.jar` symlink automatically
- Some Forge versions generate their own `run.sh`
  - In those cases, the script informs you explicitly
  - No silent failures, no guessing

---

## ⚠️ What This Repository Is *Not*

- ❌ No web panel
- ❌ No Docker setup
- ❌ No hosting service
- ❌ No one-click magic

### 🎯 Purpose

A clean, transparent toolchain for users who want to **understand and control** their Minecraft servers.

---

## 🛠 Configuration

Inside `mc`:

```bash
JAVA="java"
MIN_MEM="8G"
MAX_MEM="12G"
JAR_NAME="server.jar"
```

Everything is intentionally explicit.

---

## 🧠 Design Philosophy

- **Clear** instead of clever  
- **Bash** instead of overengineering  
- **Control** instead of black boxes  
- Errors should be **visible**, not hidden  

---

## 📄 License

MIT License  
Use it, modify it, learn from it.

---

## 👤 Author

**Noel Janzen**  
30.12.2025
