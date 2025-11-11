import express from "express";
import nodemailer from "nodemailer";
import path from "path";

const app = express();

// ✅ Сначала парсеры тела запроса
app.use(express.json()); // для JSON
app.use(express.urlencoded({ extended: true })); // для form-data

// отдаём HTML/CSS/JS из папки public
app.use(express.static(path.join(process.cwd(), "public")));

// SMTP ТРАНСПОРТ
const transporter = nodemailer.createTransport({
  host: "smtp.gmail.com",
  port: 465,
  secure: true,
  auth: {
    user: process.env.MAIL_USER,     // твой email (тот же что в gmail)
    pass: process.env.MAIL_PASSWORD  // пароль приложения, НЕ обычный пароль
  }
});

// API endpoint
app.post("/api/send-mail", async (req, res) => {
  const { name, email, message } = req.body;

  try {
    await transporter.sendMail({
      from: `"Website" <${process.env.MAIL_USER}>`,
      to: "hello@anycodestudio.com",
      subject: "New Message from Website",
      text: `Name: ${name}\nEmail: ${email}\n\n${message}`
    });

    res.status(200).send("OK");
  } catch (error) {
    console.log(error);
    res.status(500).send("ERROR");
  }
});

app.listen(process.env.PORT || 8080, () => console.log("Server running..."));