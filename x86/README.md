# Tiny Encryption and Decryption Algorithm

This assembly project demonstrates a simple encryption and decryption algorithm using x86 architecture. It prompts the user to choose between encryption, decryption, or both, and processes a 4-character input.

## Usage

1. Run the program.
2. Choose operation: "e" for Encryption, "d" for Decryption, "c" for Both, or "x" to Exit.
3. Follow prompts to enter a 4-character text for encryption/decryption.

## Code Structure

- **Data Section:**
  - `delta`: Offset value.
  - `sum`, `var0`, `var1`: Data registers.
  - `key0`, `key1`, `key2`, `key3`: Encryption/Decryption keys.
  - `message_0` to `message_5`: Display messages.

- **Code Section:**
  - `main`: Entry point, prompts user, and calls relevant functions.
  - `encryptAndDecryptOperation`, `encryptOperation`, `decryptOperation`: Main operations.
  - `encrypt`, `decrypt`: Encryption and decryption functions.

## Encryption Algorithm

The program implements a simple encryption algorithm where variables are manipulated based on bitwise operations and key addition.

## Decryption Algorithm

Decryption reverses the encryption process using the same algorithm with inverse operations.

## How to Run

Run the program using an x86 assembler and emulator.
