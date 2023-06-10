const CryptoJS = require("crypto-js");

function encryptString(text, key) {
  const encrypted = CryptoJS.AES.encrypt(text, key).toString();
  return encrypted;
}

function decryptString(encryptedText, key) {
  const decrypted = CryptoJS.AES.decrypt(encryptedText, key).toString(CryptoJS.enc.Utf8);
  return decrypted;
}

// Example usage
const plaintext = "Hello, World!";
const key = "sdGVkX19kfgqD7486A4gfpq3fFkRswIJr5v86rGg=";

const encryptedText = encryptString(plaintext, key);
console.log("Encrypted text:", encryptedText);

const decryptedText = decryptString(encryptedText, key);
console.log("Decrypted text:", decryptedText);
