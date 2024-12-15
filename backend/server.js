import express from "express"


//app instance
const app = express();

const PORT = 8000;


app.get('/', (req, res) => {
    res.send("server is ready..")
})

app.listen(PORT, ()=> {
    console.log("server is running ...")
})

