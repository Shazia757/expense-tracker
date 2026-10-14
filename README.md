# Expenzia – Personal Expense Tracker

Expenzia is a personal finance management application built with Flutter that helps users track their income and expenses, monitor their balance, and manage their daily spending. The application uses SQLite for local data storage, allowing transaction records to be saved directly on the device.

## Features

- **Dashboard:** View total balance, income, and expenses.
- **Transaction Management:** Add income and expense transactions with a name, amount, and date.
- **Input Validation:** Validate transaction details before saving.
- **Transaction History:** Access previously saved transactions.
- **Spending Overview:** View daily average and weekly spending summaries.
- **Local Database:** Store transaction records using SQLite.
- **User-Friendly Interface:** Clean interface with a teal color theme and intuitive navigation.

## Technologies Used

- **Flutter** – Cross-platform application development.
- **Dart** – Programming language.
- **SQLite** – Local relational database.
- **sqflite** – Flutter plugin for SQLite database operations.
- **path** – Database file path management.


## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code
- An Android emulator or physical device

### Installation

1. Clone the repository:

   ```bash
   git clone <https://github.com/Shazia757/expense-tracker.git>
   ```

2. Navigate to the project directory:

   ```bash
   cd expenzia
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## Database

Expenzia uses SQLite to store transaction information locally on the device.

Each transaction contains the following fields:

| Field | Description |
|---|---|
| `id` | Unique transaction identifier |
| `type` | Income or Expense |
| `name` | Transaction description |
| `amount` | Transaction amount |
| `date` | Transaction date |

The database is initialized automatically when the application first accesses it.

## How It Works

1. Launch Expenzia and navigate to the home screen.
2. View the dashboard summary.
3. Tap the add button to create a transaction.
4. Select the transaction type and enter the required details.
5. Save the transaction after completing validation.
6. View saved records and use them to calculate income, expenses, and balance.

## Future Enhancements

- Edit and delete transactions.
- Search and filter transaction history.
- Monthly and yearly financial reports.
- Expense categories and visual analytics.
- Budget setting and spending alerts.
- Data backup and cloud synchronization.

## Platform Support

Expenzia is designed as a Flutter application for mobile devices. SQLite data is stored locally on the device and is not automatically shared between devices.

