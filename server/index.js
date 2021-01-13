const express = require("express");
const fs = require("fs");

const app = express();

const host = "192.168.43.50";
const port = 8080;

var jsonData;
fs.readFile("./quotes.json", "utf8", (error, data) => {
    if (error) {
        throw error;
    }
    jsonData = data;
});

app.get("/", (request, response) => {
    response.send("/api for JSON data.");
});

app.get("/api", (request, response) => {
    response.send(JSON.parse(jsonData));
});

app.listen(port, host, () => console.log(`Server is running at http://${host}:${port}`));
