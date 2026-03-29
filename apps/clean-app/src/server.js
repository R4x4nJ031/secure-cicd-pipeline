const { createApp } = require("./app");

const app = createApp();
const port = Number(process.env.PORT || 3000);

app.listen(port, () => {
  console.log(`clean-app listening on port ${port}`);
});
