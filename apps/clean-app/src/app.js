const express = require("express");

function createApp() {
  const app = express();

  app.get("/", (_req, res) => {
    res.json({
      message: "Secure Delivery Platform clean app is running."
    });
  });

  app.get("/health", (_req, res) => {
    res.json({
      service: "clean-app",
      status: "ok"
    });
  });

  return app;
}

module.exports = {
  createApp
};
