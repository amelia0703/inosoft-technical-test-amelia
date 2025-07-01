# 📄 README.md for E2E Automation with Robot Framework

## 🚀 Overview
This repository contains an **end-to-end automation test suite using Robot Framework** with **SeleniumLibrary** and **VideoLibrary** to test purchasing workflows on [Saucedemo](https://www.saucedemo.com/). It includes:

✅ Positive scenario: successful purchase flow.  
✅ Negative scenario: invalid login handling with random password generation.  
✅ Clear acceptance criteria assertions.  
✅ Handles Google Password Manager popup automatically.

---

## ⚙️ Prerequisites
- Python 3.8 or higher
- Google Chrome installed
- Chromedriver installed and matching your Chrome version, added to PATH

---

## 🛠️ Installation
```bash
python3 -m venv venv
source venv/bin/activate   # or venv\\Scripts\\activate on Windows
pip install robotframework selenium robotframework-seleniumlibrary robotframework-video-library opencv-python
```

---

## ▶️ Running the Tests
Run the tests using:
```bash
robot -d results saucedemo.robot
```

You will get the following outputs after execution:
- `report.html` – summary execution report.
- `log.html` – detailed step-by-step execution log.
- `selenium-screenshot-*.png` – screenshots captured during execution.

---

## 📋 Test Cases
### ✅ Successful Purchase Flow (Positive)
- Logs in with valid credentials.
- Adds "Sauce Labs Backpack" to cart.
- Completes checkout.
- Verifies "Thank you for your order!" confirmation.

### ❌ Invalid Login Attempt (Negative)
- Attempts login with invalid credentials (random password).
- Confirms correct error message is displayed.

---

## 🛡️ Features
- Random password generation for negative test cases.
- Screenshot capture for every test run.
- Auto-dismisses Google Password Manager popup to prevent interruptions.

---

## 📂 Folder Structure
```
saucedemo_e2e.robot       # Main Robot Framework test suite
report.html               # Test execution report
log.html                  # Detailed execution log
```

---

## 🙌 Notes
- Use a stable internet connection for test consistency.
- Close other Chrome windows for clean video recording.
- The test currently uses visible browser mode for video recording; adjust if headless execution is needed.

---

## ✍️ Contact
For any questions, please contact: `hello.amelia73@gmail.com`

---

✅ **Ready for your QA take-home test submission.**
