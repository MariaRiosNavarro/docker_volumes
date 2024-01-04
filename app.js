import express from "express";
import multer from "multer";

const PORT = 8000;
const app = express();
const upload = multer({ dest: "./images" });

app.post("/", upload.single("img"), (_, res) => {
  res.json({ message: "Gespeichert" });
});

app.listen(8000, () => console.log("Port is in:" + PORT));
