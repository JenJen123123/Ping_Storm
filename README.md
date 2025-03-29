
# 🌩️ Ping_Storm

An efficient and powerful ping tool designed to monitor network performance, diagnose connectivity issues, and perform stress tests on networks.

Made By Jenya, Noya, Nadya & Yoel.

---

## 🚀 Features

- ✅ **Easy to Use:** Simple and intuitive CLI interface.
- 🌐 **Network Monitoring:** Quickly identify latency and packet loss.
- 📊 **Real-time Data:** Instant feedback on network conditions.
- ⚡ **High Performance:** Fast execution and minimal resource usage.

---

## 📥 Installation

Clone the repository:

```bash
git clone https://github.com/JenJen123123/Ping_Storm.git
cd Ping_Storm
```

Make scripts executable:

```bash
chmod +x *.sh
```

---

## 📂 Project Structure

- 📄 **ping.sh** - Main script for ping operations.
- ⚙️ **control.sh** - Control and manage ongoing ping tasks.
- 🔍 **Res_analyzing.sh** - Analyze ping results and generate reports.
- 📌 **ps.sh** - Check the status of current ping processes.
- 📊 **show.sh** - Display stored data and results visually.
- 📈 **pingstorm_report.csv** - CSV formatted detailed report of ping results.
- 📑 **pingstorm.log** - Detailed logs of ping operations.
- 📋 **DataLog.txt** - General ping operation log data.
- 🚨 **Error.log** - Records all errors during ping operations.
- ✅ **noErrorLog.txt** - Logs successful ping operations without errors.

---

## 🛠️ Usage

To run the tool, simply execute the `control.sh` script. This will handle everything, including pinging the services and analyzing the results:

```bash
./control.sh
```

### Interactive Menu Options:

```bash
~~~ PINGSTORM CONTROL PANEL ~~~

❌ No Ping Storm is not running

1) Start - Begin pinging services
2) Stop - Stop all running ping operations
3) Status - Display current ping status and summary
4) Show - Generate and display a detailed report
5) Quit - Exit the control panel
#?
```

### Examples:

- **Starting Ping Storm:**

  ```bash
  #? 1
  ~~~ Starting Ping Storm ~~~

  Ping Storm started in background (PID : 72836)
  Output is being saved to pingstorm.log
  ```

- **Stopping Ping Storm:**

  ```bash
  #? 2
  🛑 ping.sh script stopped
  🛑 ping command stopped
  ```

- **Status Overview:**

  ```bash
  #? 3
  ~~~ Ping Storm Status ~~~

  Website         Min     Max
  -----------------------------
  facebook.com    45.454  45.454
  youtube.com     7.379   7.379
  google.com      7.257   7.257
  tiktok.com      6.595   6.595

  Summary of the results
  -----------------------------
  Fastest: tiktok.com    6.595 ms
  Slowest: facebook.com  45.454 ms
  Average: 16.671 ms
  ```

- **Detailed Report:**

  ```bash
  #? 4
  🌐 PINGSTORM REPORT

  📋 Pinging 5 services

  🚀 Fastest:
  tiktok.com 6.595

  🐢 Slowest:
  facebook.com 45.454

  📊 Average: 16.671

  ✅ Report exported to pingstorm_report.csv
  ```

---

## 🛠️ Requirements

- Bash shell

---

## 🤝 Contributing

Contributions are welcome! Please fork the repository, create your branch, and submit a pull request.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📧 Contact

For questions or feedback, open an issue or reach out via GitHub.

Happy pinging! 🚀🌩️
