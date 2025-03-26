
# Ping Storm 🌐⚡

Ping Storm is a simple yet effective tool that measures and compares internet latency to major online services like Google, Facebook, TikTok, etc. It helps in simulating a speed test by pinging various services and analyzing their response times.

---

## 📂 Project Structure

- **`README.md`** - Project description (this file).
- **`ping.sh`** - Main script for pinging services.
- **`Res_analyzing.sh`** - Script for analyzing the ping results.
- **`control.sh`** - Controls the execution of the tool.
- **`DataLog.txt`** - Log file for storing the ping results.
- **`Error.log`** - Log file for storing errors.
- **`noErrorLog.txt`** - Log file that excludes errors, ensuring the analysis script won't fail.

---

## 🚀 Installation

1. Clone the repository:

```bash
git clone https://github.com/JenJen123123/Ping_Storm.git
```

2. Navigate to the project directory:

```bash
cd Ping_Storm
```

3. Give execution permission to the scripts:

```bash
chmod +x ping.sh Res_analyzing.sh control.sh
```

---

## 🛠️ Usage

1. To run the tool, simply execute the `control.sh` script. This will handle everything, including pinging the services and analyzing the results:

```bash
./control.sh
```

2. After the script finishes, you can check the logs in `DataLog.txt` for the ping results and in `Error.log` for any errors encountered during the execution.

---

## 🎛️ Control Script: `control.sh`

The `control.sh` script manages the overall process of Ping Storm. It ensures that the ping tests run sequentially and that the results are analyzed afterward. Here’s what it does:

1. **Runs the `ping.sh` script** to begin the ping tests.
2. **Waits for the completion** of the ping process.
3. **Triggers the analysis** by calling the `Res_analyzing.sh` script to process and display the results.
4. **Logs errors** into `Error.log` to capture any issues that may arise during execution.

### How to Use:

To control the entire process, simply run:

```bash
./control.sh
```

This will initiate the sequence of pinging services and then analyze the results once the tests are finished.

---

## 📝 noErrorLog

The `noErrorLog.txt` file is a special log file that contains the ping results **without** any errors. This file is used to ensure that the analysis script (`Res_analyzing.sh`) does not fail due to error entries in the log. By using `noErrorLog.txt`, you can smoothly analyze the results without interruptions from error-related issues.

---

## 🧑‍💻 Example Output

Once you run the tool, it will ping the services and display results in the terminal similar to the following:

```
Pinging Google...
Google latency: 20ms

Pinging Facebook...
Facebook latency: 30ms

Pinging TikTok...
TikTok latency: 50ms
```

The results will be logged in `DataLog.txt` and errors in `Error.log`. If you want a log without errors, you can use `noErrorLog.txt`.

---

## 🔧 Contributing

If you'd like to contribute, feel free to fork the repository, make changes, and open a pull request. Any contributions are welcome!

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🔗 Links

- [GitHub Repository](https://github.com/JenJen123123/Ping_Storm)
